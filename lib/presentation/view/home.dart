import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:smart_home_flutter/core/navigation/navigator.dart';
import 'package:smart_home_flutter/presentation/bloc/bloc.dart';
import 'package:smart_home_flutter/presentation/bloc/state.dart';
import 'package:smart_home_flutter/presentation/view/widgets/device_card.dart';
import 'package:smart_home_flutter/presentation/view/widgets/error_widget.dart';
import 'package:smart_home_flutter/presentation/view/widgets/header_widget.dart';
import 'package:smart_home_flutter/presentation/view/widgets/loading_widget.dart';
import 'package:smart_home_flutter/presentation/view/widgets/routines.dart';
import 'package:smart_home_flutter/presentation/view/widgets/temperature_widget.dart';

import '../../domain/entity/device.dart';
import '../../utils/resources.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Position? position;
  SmartHomeBloc? smartHomeBloc;

  @override
  void initState() {
    smartHomeBloc = BlocProvider.of<SmartHomeBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    smartHomeBloc?.getWeatherData();
    return BlocConsumer<SmartHomeBloc, SmartHomeState>(
      listener: (context, state) {},
      buildWhen: (previous, current) {
        return previous.isLoading != current.isLoading;
      },
      builder: (context, state) {
        if (state.isLoading) {
          return const LoadingWidget();
        } else if (state.error.isNotEmpty) {
          return CustomErrorWidget(
            refresh: () {
              smartHomeBloc!.getWeatherData();
            },
            errorMessage: state.error,
          );
        }
        return Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 32.h + MediaQuery.of(context).padding.top),
                  const HeaderWidget(),
                  SizedBox(height: 32.h),
                  TemperatureWidget(
                    temperature:
                        state.weather.main?.temp.toString() ?? emptyString,
                    humidity:
                        state.weather.main?.humidity.toString() ?? emptyString,
                    location:
                        "${state.weather.name ?? emptyString},${state.weather.sys?.country ?? emptyString}",
                  ),
                  SizedBox(height: 32.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Quick Action',
                        style: TextStyles.body.copyWith(
                          fontWeight: FontWeight.w500,
                          color: AppColors.grey,
                        ),
                      ),
                      Text(
                        'Edit',
                        style: TextStyles.body.copyWith(
                          color: AppColors.grey60,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ...['Wake up', 'Sleep', 'Clean']
                          .map((e) => Routines(action: e))
                    ],
                  ),
                  SizedBox(height: 32.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Active Devices',
                        style: TextStyles.body.copyWith(
                          fontWeight: FontWeight.w500,
                          color: AppColors.grey,
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          final Device device =
                              await AppNavigator.pushNamed(addNewDeviceRoute);
                          smartHomeBloc!.addNewDevice(device: device);
                        },
                        child: Text(
                          'Add new Device',
                          style: TextStyles.body.copyWith(
                            fontWeight: FontWeight.w500,
                            color: AppColors.grey60,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      mainAxisExtent: 130,
                    ),
                    itemCount: state.deviceList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return DeviceCard(
                        device: state.deviceList[index],
                        onActivePressed: (isActive) {
                          smartHomeBloc!.setActiveFlag(
                            isActive: isActive,
                            index: index,
                          );
                        },
                        onPressed: () async {
                          final Device device = await AppNavigator.pushNamed(
                            state.deviceList[index].type.routeName,
                            arguments: state.deviceList[index],
                          );
                          smartHomeBloc!.setNewValue(
                            updatedDevice: device,
                            index: index,
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
