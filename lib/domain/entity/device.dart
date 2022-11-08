import 'dart:core';

import 'package:smart_home_flutter/utils/enums.dart';

class Device {
  String id;
  String name;
  String image;
  DeviceType type;
  bool isActive;
  double value;
  Routine? routine;

  Device({
    required this.id,
    required this.name,
    required this.image,
    required this.type,
    required this.isActive,
    required this.value,
    this.routine,
  });
}

class Routine {
  DateTime start;
  DateTime end;

  Routine({required this.start, required this.end});
}
