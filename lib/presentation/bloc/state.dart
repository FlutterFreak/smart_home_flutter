import '../../../data/model/weather.dart';
import '../../../domain/entity/device.dart';

class SmartHomeState {
  final Weather weather;
  final String error;
  final bool isLoading;
  final List<Device> deviceList;

  SmartHomeState({
    required this.weather,
    required this.error,
    required this.isLoading,
    required this.deviceList,
  });

  SmartHomeState.initialized()
      : this(weather: Weather(), error: "", isLoading: true, deviceList: []);

  SmartHomeState.loading()
      : this(weather: Weather(), error: "", isLoading: true, deviceList: []);

  SmartHomeState copyWith({
    Weather? weather,
    String? error,
    bool? isLoading,
    List<Device>? deviceList,
  }) {
    return SmartHomeState(
      weather: weather ?? this.weather,
      error: error ?? this.error,
      isLoading: isLoading ?? this.isLoading,
      deviceList: deviceList ?? this.deviceList,
    );
  }
}
