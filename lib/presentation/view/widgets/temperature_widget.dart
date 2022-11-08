import 'package:flutter/material.dart';
import 'package:smart_home_flutter/utils/resources.dart';

class TemperatureWidget extends StatelessWidget {
  final String temperature;
  final String humidity;
  final String location;
  const TemperatureWidget({
    Key? key,
    required this.temperature,
    required this.humidity,
    required this.location,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(6.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                temperatureText,
                style: TextStyles.body.copyWith(color: AppColors.tertiary),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Icon(
                    Icons.thermostat,
                    size: 24,
                    color: AppColors.tertiary,
                  ),
                  Text(
                    temperature,
                    style:
                        TextStyles.subtitle.copyWith(color: AppColors.tertiary),
                  ),
                ],
              )
            ],
          ),
          Column(
            children: [
              Text(
                humidityText,
                style: TextStyles.body.copyWith(color: AppColors.tertiary),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Icon(
                    Icons.water_drop_outlined,
                    size: 24,
                    color: AppColors.tertiary,
                  ),
                  Text(
                    humidity,
                    style:
                        TextStyles.subtitle.copyWith(color: AppColors.tertiary),
                  ),
                ],
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                locationText,
                style: TextStyles.body.copyWith(color: AppColors.tertiary),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Icon(
                    Icons.location_city_sharp,
                    size: 24,
                    color: AppColors.tertiary,
                  ),
                  Text(
                    location,
                    style:
                        TextStyles.subtitle.copyWith(color: AppColors.tertiary),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
