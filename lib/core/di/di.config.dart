// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../networking/api_factory.dart' as _i269;
import '../networking/dio_factory.dart' as _i103;
import 'package_module.dart' as _i611;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final packageModule = _$PackageModule();
    gh.factory<_i361.Dio>(() => packageModule.getDio());
    gh.factory<_i269.ApiFactory>(() => _i103.DioFactory(dio: gh<_i361.Dio>()));
    return this;
  }
}

class _$PackageModule extends _i611.PackageModule {}
