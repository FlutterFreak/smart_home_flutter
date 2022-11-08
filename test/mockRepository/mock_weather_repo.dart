import 'package:bloc_test/bloc_test.dart';
import 'package:injectable/injectable.dart';
import 'package:mockito/annotations.dart';
import 'package:smart_home_flutter/domain/repository/weather_repo.dart';
import 'package:smart_home_flutter/presentation/bloc/bloc.dart';
import 'package:smart_home_flutter/presentation/bloc/state.dart';

import 'mock_weather_repo.mocks.dart';

@Environment("test")
@LazySingleton(as: WeatherRepo)
@GenerateMocks([WeatherRepo])
class MockWeatherRepository extends MockWeatherRepo implements WeatherRepo {}

class MockMyCubit extends MockCubit<SmartHomeState> implements SmartHomeBloc {}
