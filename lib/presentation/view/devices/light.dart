import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_home_flutter/utils/app_assets.dart';

import '../../../../core/navigation/navigator.dart';
import '../../../domain/entity/device.dart';
import '../../../utils/resources.dart';
import '../widgets/gradient_progress_indicator.dart';
import '../widgets/power_btn.dart';

class LightScreen extends StatefulWidget {
  final Device device;
  LightScreen({Key? key, required this.device})
      : assert(device.type == DeviceType.light),
        super(key: key);

  @override
  State<LightScreen> createState() => _LightScreenState();
}

class _LightScreenState extends State<LightScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
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
                        'Light',
                        style: TextStyles.headline4,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 36.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Living Room',
                        style: TextStyles.headline4
                            .copyWith(color: AppColors.grey),
                      ),
                      Switch.adaptive(
                        value: widget.device.isActive,
                        onChanged: (bool v) {
                          setState(() {
                            widget.device.isActive = v;
                          });
                        },
                        activeColor: AppColors.primary,
                      )
                    ],
                  ),
                  Text(
                    'Light Intesity',
                    style: TextStyles.body.copyWith(color: AppColors.grey60),
                  ),
                ],
              ),
              SizedBox(height: 24.h),
              if (widget.device.isActive)
                Image.asset(
                  lightOn,
                  width: 159.w,
                )
              else
                Image.asset(
                  lightOff,
                  width: 75.w,
                ),
              SizedBox(height: 40.h),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GradientCircularProgressIndicator(
                    radius: 100.r,
                    gradientColors: [
                      const Color(0XFFE89D0D),
                      const Color(0XFFFCFBC3),
                      AppColors.primary,
                      AppColors.secondary,
                    ],
                    strokeWidth: 28.0.w,
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
