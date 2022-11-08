import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../domain/entity/device.dart';
import '../../../utils/resources.dart';

class DeviceCard extends StatefulWidget {
  final Device device;
  final Function(bool isActive) onActivePressed;
  final VoidCallback onPressed;
  const DeviceCard({
    Key? key,
    required this.device,
    required this.onActivePressed,
    required this.onPressed,
  }) : super(key: key);

  @override
  State<DeviceCard> createState() => _DeviceCardState();
}

class _DeviceCardState extends State<DeviceCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: Container(
        padding: EdgeInsets.all(16.r),
        decoration: BoxDecoration(
          color: AppColors.secondary30,
          borderRadius: BorderRadius.circular(6.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(
                  widget.device.type.icon,
                  width: 48.w,
                ),
                SizedBox(width: 32.w),
                Switch.adaptive(
                  activeColor: AppColors.primary,
                  value: widget.device.isActive,
                  onChanged: (isActive) {
                    widget.onActivePressed(isActive);
                  },
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
              ],
            ),
            SizedBox(height: 32.h),
            Text(
              widget.device.name,
              style: TextStyles.body.copyWith(color: AppColors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
