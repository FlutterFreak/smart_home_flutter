import 'package:smart_home_flutter/utils/constants.dart';
import 'package:smart_home_flutter/utils/enums.dart';
import 'package:uuid/uuid.dart';

import '../../domain/entity/device.dart';
import '../../utils/app_assets.dart';

const uuid = Uuid();
List<String> devicsNames = [ac, smartTv, cctv, refrigerator, microwave, light];
List<Device> devicesListData = [
  Device(
    id: uuid.v4(),
    name: ac,
    type: DeviceType.ac,
    image: airConditioner,
    isActive: true,
    value: 25,
  ),
  Device(
    id: uuid.v4(),
    name: light,
    type: DeviceType.light,
    image: lamp,
    isActive: true,
    value: 100,
  ),
  Device(
    id: uuid.v4(),
    name: smartTv,
    type: DeviceType.smartTv,
    image: television,
    isActive: true,
    value: 50,
  ),
  Device(
    id: uuid.v4(),
    name: cctv,
    type: DeviceType.cctv,
    image: camera,
    isActive: true,
    value: 0,
  ),
];
