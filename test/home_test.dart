// // This is a basic Flutter widget test.
// //
// // To perform an interaction with a widget in your test, use the WidgetTester
// // utils in the flutter_test package. For example, you can send tap and scroll
// // gestures. You can also use WidgetTester to find child widgets in the widget
// // tree, read text, and verify that the values of widget properties are correct.
//
// import 'package:dartz/dartz.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:injectable/injectable.dart';
// import 'package:mockito/mockito.dart';
// import 'package:smart_home_flutter/core/di/injection.dart';
// import 'package:smart_home_flutter/data/model/weather.dart';
// import 'package:smart_home_flutter/domain/entity/device.dart';
// import 'package:smart_home_flutter/domain/repository/weather_repo.dart';
// import 'package:smart_home_flutter/presentation/bloc/bloc.dart';
// import 'package:smart_home_flutter/presentation/view/home.dart';
// import 'package:smart_home_flutter/utils/enums.dart';
//
// import 'mockRepository/mock_weather_repo.dart';
//
// void main() {
//   late MockMyCubit mockMyCubit;
//   late MockWeatherRepository mockRepo;
//   setUpAll(
//     () async {
//       configureInjection(Environment.test);
//       mockMyCubit = MockMyCubit();
//       mockRepo = MockWeatherRepository();
//       await getIt.unregister<SmartHomeBloc>();
//       await getIt.unregister<WeatherRepo>();
//       getIt.registerFactory<SmartHomeBloc>(() => MockMyCubit());
//       getIt.registerFactory<MockWeatherRepository>(
//           () => MockWeatherRepository());
//     },
//   );
//   tearDownAll(() {
//     getIt.reset();
//   });
//   testWidgets('Home screen loads weather data from api successfully',
//       (WidgetTester tester) async {
//     when(mockRepo.getCurrentWeather("appId", 0, 0)).thenAnswer(
//       (_) async => Right(
//         Weather(
//           main: Main(temp: 25, humidity: 60),
//           sys: Sys(country: "India"),
//           name: "Jaipur",
//         ),
//       ),
//     );
//     // Build our app and trigger a frame.
//     await tester.pumpWidget(
//       MaterialApp(
//         home: BlocProvider(
//           create: (context) => getIt<SmartHomeBloc>(),
//           child: const Home(),
//         ),
//       ),
//     );
//     mockMyCubit.addNewDevice(
//         device: Device(
//             id: "id",
//             name: "name",
//             image: "image",
//             type: DeviceType.light,
//             isActive: true,
//             value: 100));
//     // Verify that our counter starts at 0.
//     expect(find.text('name'), findsOneWidget);
//   });
// }
