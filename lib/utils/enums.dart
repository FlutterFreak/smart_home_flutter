import 'package:smart_home_flutter/utils/app_assets.dart';
import 'package:smart_home_flutter/utils/constants.dart';

import '../core/navigation/navigator.dart';

enum DeviceType {
  ac,
  smartTv,
  cctv,
  refrigerator,
  microwave,
  light,
}

extension DeviceTypeExtension on DeviceType {
  String get icon {
    switch (this) {
      case DeviceType.ac:
        return airConditioner;
      case DeviceType.smartTv:
        return television;
      case DeviceType.cctv:
        return camera;
      case DeviceType.refrigerator:
        return fridge;
      case DeviceType.microwave:
        return oven;
      case DeviceType.light:
        return lamp;
      default:
        return emptyString;
    }
  }

  String get routeName {
    switch (this) {
      case DeviceType.ac:
        return acRoute;
      case DeviceType.smartTv:
        return smartTvRoute;
      case DeviceType.cctv:
        return cctvRoute;
      case DeviceType.refrigerator:
        return refridgeratorRoute;
      case DeviceType.light:
        return lightRoute;
      default:
        return unknown;
    }
  }
}
