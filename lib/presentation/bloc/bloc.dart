import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_home_flutter/domain/repository/weather_repo.dart';
import 'package:smart_home_flutter/presentation/bloc/state.dart';

import '../../data/dataSource/devices_data.dart';
import '../../domain/entity/device.dart';
import '../../utils/constants.dart';

@injectable
class SmartHomeBloc extends Cubit<SmartHomeState> {
  final WeatherRepo weatherRepo;

  SmartHomeBloc(this.weatherRepo) : super(SmartHomeState.initialized());

  List<Device> devicelist = [];

  Future<void> getWeatherData() async {
    emit(SmartHomeState.loading());
    final position = await getCurrentPosition();
    devicelist = devicesListData;
    final result = await weatherRepo.getCurrentWeather(
      openWeatherAPIKey,
      position.latitude,
      position.longitude,
    );
    result.fold(
      (left) => left.map(
        serverError: (e) => emit(
          state.copyWith(
            isLoading: false,
            error: e.msg,
          ),
        ),
        apiFailure: (e) => emit(
          state.copyWith(
            isLoading: false,
            error: e.msg,
          ),
        ),
      ),
      (right) => emit(
        state.copyWith(
          isLoading: false,
          deviceList: devicelist,
          weather: right,
        ),
      ),
    );
  }

  Future<Position> getCurrentPosition() async {
    Position? position;
    await Geolocator.requestPermission();
    try {
      position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
    } catch (e) {
      log(e.toString());
    }
    return position!;
  }

  void setActiveFlag({required bool isActive, required int index}) {
    emit(state.copyWith(isLoading: true));
    final device = devicelist[index];
    final updatedDevice = Device(
      id: device.id,
      name: device.name,
      type: device.type,
      image: device.image,
      isActive: isActive,
      value: device.value,
      routine: device.routine,
    );
    devicelist.removeAt(index);
    devicelist.insert(index, updatedDevice);
    emit(state.copyWith(isLoading: false, deviceList: devicelist));
  }

  void setNewValue({required Device updatedDevice, required int index}) {
    emit(state.copyWith(isLoading: true));
    devicelist.removeAt(index);
    devicelist.insert(index, updatedDevice);
    emit(state.copyWith(isLoading: false, deviceList: devicelist));
  }

  void addNewDevice({required Device device}) {
    emit(state.copyWith(isLoading: true));
    devicelist.add(device);
    emit(state.copyWith(isLoading: false, deviceList: devicelist));
  }
}
