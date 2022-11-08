import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_home_flutter/core/navigation/route.dart';
import 'package:smart_home_flutter/utils/resources.dart';

import '../../domain/entity/device.dart';
import '../../presentation/view/devices/ac.dart';
import '../../presentation/view/devices/add_new_device.dart';
import '../../presentation/view/devices/light.dart';

class AppRouter {
  AppRouter._();
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      // case routineRoute:
      //   return getPageRoute(
      //     settings: settings,
      //     view: const RoutineHomeScreen(),
      //   );

      case lightRoute:
        return getPageRoute(
          settings: settings,
          view: LightScreen(device: settings.arguments! as Device),
        );

      case acRoute:
        return getPageRoute(
          settings: settings,
          view: AcScreen(device: settings.arguments! as Device),
        );

      case addNewDeviceRoute:
        return getPageRoute(
          settings: settings,
          view: const AddNewDevice(),
        );

      default:
        return getPageRoute(
          settings: settings,
          view: Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.primary,
            ),
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }

  static PageRoute<dynamic> getPageRoute({
    required RouteSettings settings,
    required Widget view,
  }) {
    return Platform.isIOS
        ? CupertinoPageRoute(settings: settings, builder: (_) => view)
        : MaterialPageRoute(settings: settings, builder: (_) => view);
  }
}
