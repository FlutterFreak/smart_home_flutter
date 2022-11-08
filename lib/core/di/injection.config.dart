// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../domain/repository/Impl/weather_repo_impl.dart' as _i4;
import '../../domain/repository/weather_repo.dart' as _i3;
import '../../presentation/bloc/bloc.dart' as _i5;

const String _dev = 'dev';
const String _test = 'test';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  gh.lazySingleton<_i3.WeatherRepo>(
    () => _i4.WeatherRepoImpl(),
    registerFor: {
      _dev,
      _test,
    },
  );
  gh.factory<_i5.SmartHomeBloc>(
      () => _i5.SmartHomeBloc(get<_i3.WeatherRepo>()));
  return get;
}
