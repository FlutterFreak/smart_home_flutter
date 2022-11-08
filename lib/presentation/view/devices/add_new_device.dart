import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_home_flutter/presentation/view/widgets/button.dart';

import '../../../core/navigation/navigator.dart';
import '../../../data/dataSource/devices_data.dart';
import '../../../domain/entity/device.dart';
import '../../../utils/resources.dart';

class AddNewDevice extends StatefulWidget {
  const AddNewDevice({Key? key}) : super(key: key);

  @override
  State<AddNewDevice> createState() => _AddNewDeviceState();
}

class _AddNewDeviceState extends State<AddNewDevice> {
  Device device = Device(
    id: uuid.v4(),
    name: "",
    type: DeviceType.ac,
    image: '',
    isActive: true,
    value: 0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Padding(
          padding: EdgeInsets.all(24.w),
          child: Column(
            children: [
              SizedBox(height: 32.h + MediaQuery.of(context).padding.top),
              Row(
                children: [
                  if (AppNavigator.canPop)
                    GestureDetector(
                      onTap: () => AppNavigator.pop(),
                      child: const Icon(Icons.arrow_back_ios),
                    ),
                  Expanded(
                    child: Center(
                      child: Text(
                        addNewDevice,
                        style: TextStyles.headline4,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 100.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Text(
                      'Device Name: ',
                      style: TextStyles.body.copyWith(
                        fontWeight: FontWeight.w500,
                        color: AppColors.grey,
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(8),
                        fillColor: Colors.black,
                        isDense: true,
                        border: Decorators.defaultLightBorder,
                      ),
                      keyboardType: TextInputType.text,
                      style: TextStyles.subtitle,
                      onChanged: (text) {
                        setState(() {
                          device.name = text;
                        });
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 34.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Text(
                      'Device Type: ',
                      style: TextStyles.body.copyWith(
                        fontWeight: FontWeight.w500,
                        color: AppColors.grey,
                      ),
                    ),
                  ),
                  Expanded(
                    child: DropdownButtonFormField<DeviceType>(
                      value: device.type,
                      focusColor: AppColors.primary,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(5),
                        hintText: "Please choose a type",
                        fillColor: Colors.black,
                        isDense: true,
                        border: Decorators.defaultLightBorder,
                      ),
                      items: DeviceType.values.asMap().values.map((val) {
                        return DropdownMenuItem<DeviceType>(
                          value: val,
                          child: Text(
                            val.name[0].toUpperCase() + val.name.substring(1),
                          ),
                        );
                      }).toList(),
                      onChanged: (newVal) {
                        setState(() {
                          device.type = newVal!;
                        });
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 34.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Text(
                      'Active Status: ',
                      style: TextStyles.body.copyWith(
                        fontWeight: FontWeight.w500,
                        color: AppColors.grey,
                      ),
                    ),
                  ),
                  Expanded(
                    child: DropdownButtonFormField<bool>(
                      value: device.isActive,
                      focusColor: AppColors.primary,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(5),
                        fillColor: Colors.black,
                        isDense: true,
                        border: Decorators.defaultLightBorder,
                      ),
                      items: [true, false].map((val) {
                        return DropdownMenuItem<bool>(
                          value: val,
                          child: Text(
                            val.toString()[0].toUpperCase() +
                                val.toString().substring(1),
                          ),
                        );
                      }).toList(),
                      onChanged: (newVal) {
                        setState(() {
                          device.isActive = newVal!;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const Spacer(),
              AppButtonPrimary(
                label: 'Add Device',
                onPressed: () {
                  if (device.name.isNotEmpty) {
                    device.image = device.type.icon;
                    AppNavigator.pop(device);
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
