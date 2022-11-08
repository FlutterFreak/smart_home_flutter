import 'package:chopper/chopper.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_home_flutter/data/model/weather.dart';
import 'package:smart_home_flutter/domain/repository/weather_repo.dart';

import '../../../core/di/injection.dart';
import '../../api/client/weather_api_service.dart';
import '../../api/exception/exception.dart';
import '../../api/failure/failures.dart';

@LazySingleton(as: WeatherRepo, env: [Environment.dev, Environment.test])
class WeatherRepoImpl with HttpHandlerMixin implements WeatherRepo {
  @override
  Future<Either<ServerFailure, Weather>> getCurrentWeather(
    String appId,
    double lat,
    double long,
  ) async {
    Response? result;
    try {
      final result =
          await getIt<WeatherApiService>().getCurrentWeather(lat, long, appId);

      if (result.isSuccessful) {
        final Weather response = Weather.fromJson(result.body!);
        if (kDebugMode) {
          print("response ${response.name}");
        }
        return right(response);
      } else {
        return left(ServerFailure.apiFailure(msg: result.error.toString()));
      }
    } catch (e) {
      return left(ServerFailure.serverError(msg: catchExceptions(result, e)));
    }
  }
}
