import 'package:dartz/dartz.dart';

import '../../data/model/weather.dart';
import '../api/failure/failures.dart';

abstract class WeatherRepo {
  Future<Either<ServerFailure, Weather>> getCurrentWeather(
    String appId,
    double lat,
    double long,
  );
}
