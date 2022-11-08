import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_home_flutter/presentation/bloc/bloc.dart';
import 'package:smart_home_flutter/presentation/view/home.dart';
import 'package:smart_home_flutter/utils/themes.dart';

import 'core/di/injection.dart';
import 'core/navigation/navigator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureInjection(Environment.dev);
  runApp(
    BlocProvider(
      create: (context) => getIt<SmartHomeBloc>(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Smart Home',
          theme: AppTheme.lightTheme,
          onGenerateRoute: AppRouter.generateRoutes,
          navigatorKey: AppNavigator.key,
          home: const Home(),
        );
      },
    );
  }
}
