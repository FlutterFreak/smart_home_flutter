import 'package:flutter/material.dart';

import 'resources.dart';

class AppTheme {
  AppTheme._();
  static final ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.tertiary,
    splashColor: Colors.transparent,
    brightness: Brightness.light,
    highlightColor: Colors.transparent,
    dividerColor: Colors.transparent,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      showUnselectedLabels: true,
      backgroundColor: AppColors.tertiary,
      selectedItemColor: AppColors.primary,
      type: BottomNavigationBarType.fixed,
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.only(
        top: 1 * Decorators.fontSize,
        bottom: 1 * Decorators.fontSize,
        right: 1 * Decorators.fontSize,
        left: 1 * Decorators.fontSize,
      ),
      hintStyle: TextStyles.body.copyWith(color: AppColors.grey60),
      fillColor: AppColors.black,
      border: Decorators.defaultLightBorder,
      enabledBorder: Decorators.enabledLightBorder,
      focusedBorder: Decorators.focusedLightBorder,
      focusedErrorBorder: Decorators.focusedErrorLightBorder,
      disabledBorder: Decorators.disabledLightBorder,
    ),
    textTheme: TextTheme(
      headline1: TextStyles.headline1,
      bodyText1: TextStyles.body,
      bodyText2: TextStyles.body,
      button: TextStyles.body,
      caption: TextStyles.body,
      headline2: TextStyles.headline2,
      headline3: TextStyles.headline3,
      headline4: TextStyles.headline4,
      subtitle2: TextStyles.subtitle,
      subtitle1: TextStyles.subtitle,
    ),
  );
}
