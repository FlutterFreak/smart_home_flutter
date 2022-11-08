import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

import '../../../../core/navigation/navigator.dart';
import '../../../domain/entity/device.dart';
import '../../../utils/resources.dart';
import '../widgets/power_btn.dart';

class AcScreen extends StatefulWidget {
  final Device device;

  AcScreen({Key? key, required this.device})
      : assert(device.type == DeviceType.ac),
        super(key: key);

  @override
  State<AcScreen> createState() => _AcScreenState();
}

class _AcScreenState extends State<AcScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 32.h + MediaQuery.of(context).padding.top),
              Row(
                children: [
                  if (AppNavigator.canPop)
                    GestureDetector(
                      onTap: () => AppNavigator.pop(widget.device),
                      child: const Icon(Icons.arrow_back_ios),
                    ),
                  Expanded(
                    child: Center(
                      child: Text(
                        airCon,
                        style: TextStyles.headline4,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 100.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        ac,
                        style: TextStyles.headline4
                            .copyWith(color: AppColors.grey),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        temperatureText,
                        style:
                            TextStyles.body.copyWith(color: AppColors.grey60),
                      ),
                      Text(
                        widget.device.value.toString(),
                        style:
                            TextStyles.body.copyWith(color: AppColors.grey60),
                      ),
                    ],
                  ),
                ],
              ),
              Center(
                child: SleekCircularSlider(
                  min: 16,
                  max: 31,
                  initialValue: widget.device.value,
                  appearance: CircularSliderAppearance(
                    size: 300.r,
                    customColors: CustomSliderColors(
                      progressBarColor: AppColors.primary,
                      trackColor: AppColors.grey30,
                      dotColor: AppColors.primary,
                    ),
                    customWidths: CustomSliderWidths(
                      progressBarWidth: 8.w,
                      trackWidth: 8.w,
                      handlerSize: 16.r,
                    ),
                  ),
                  onChange: (double value) {
                    setState(() {
                      widget.device.value =
                          double.parse(value.toStringAsFixed(1));
                    });
                  },
                  onChangeStart: (double startValue) {
                    // callback providing a starting value (when a pan gesture starts)
                  },
                  onChangeEnd: (double endValue) {
                    // callback providing an ending value (when a pan gesture ends)
                  },
                  innerWidget: (double value) {
                    //This the widget that will show current value
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            cool,
                            style: TextStyles.body
                                .copyWith(color: AppColors.grey60),
                          ),
                          SizedBox(height: 20.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                backgroundColor:
                                    widget.device.value.floor() <= 16
                                        ? AppColors.grey30
                                        : AppColors.primary,
                                child: IconButton(
                                  icon: const Icon(Icons.remove),
                                  onPressed: widget.device.value.floor() <= 16
                                      ? null
                                      : () {
                                          setState(() {
                                            widget.device.value--;
                                          });
                                        },
                                ),
                              ),
                              SizedBox(width: 16.w),
                              Text(
                                "${value.toStringAsFixed(1)}°C",
                                style: TextStyles.headline4.copyWith(
                                  color: AppColors.grey80,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(width: 16.w),
                              CircleAvatar(
                                backgroundColor:
                                    widget.device.value.round() == 31
                                        ? AppColors.grey30
                                        : AppColors.primary,
                                child: IconButton(
                                  icon: const Icon(Icons.add),
                                  onPressed: widget.device.value.round() == 31
                                      ? null
                                      : () {
                                          widget.device.value++;
                                        },
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 56.h),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 27.5.w,
                              vertical: 6.5.h,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.grey10,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Text(
                              adjust,
                              style: TextStyles.subtitle.copyWith(
                                color: AppColors.primary,
                              ),
                            ),
                          ),
                          SizedBox(height: 20.h),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 62.w),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 48.w,
                        vertical: 10.h,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.secondary10,
                        borderRadius: BorderRadius.circular(100.r),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.sunny,
                            color: AppColors.primary,
                            size: 32.w,
                          ),
                          Icon(
                            Icons.water_drop_outlined,
                            color: AppColors.primary,
                            size: 32.w,
                          ),
                          Icon(
                            Icons.cloud_rounded,
                            color: AppColors.primary,
                            size: 32.w,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 56.h),
                  ],
                ),
              ),
              SizedBox(height: 80.h),
              ChipButton(
                backgroundColor: widget.device.isActive
                    ? AppColors.primary
                    : AppColors.tertiary,
                forgroundColor: widget.device.isActive
                    ? AppColors.tertiary
                    : AppColors.primary,
                onPressed: () {
                  setState(() {
                    widget.device.isActive = !widget.device.isActive;
                  });
                },
                child: const Icon(Icons.power_settings_new_rounded),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
