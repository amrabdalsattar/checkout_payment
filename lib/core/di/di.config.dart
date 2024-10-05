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
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i973;

import '../../features/checkout/data/data_sources/payment_services/stripe_service.dart'
    as _i750;
import '../../features/checkout/data/repos/checkout_repo.dart' as _i553;
import '../networking/api_factory.dart' as _i269;
import '../networking/dio_factory.dart' as _i103;
import '../payment_services/stripe_service.dart' as _i619;
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
    gh.factory<_i973.InternetConnectionChecker>(
        () => packageModule.getInternetConnectionChecker());
    gh.factory<_i269.ApiFactory>(() => _i103.DioFactory(dio: gh<_i361.Dio>()));
    gh.factory<_i750.StripeService>(
        () => _i750.StripeService(gh<_i269.ApiFactory>()));
    gh.factory<_i619.StripeService>(
        () => _i619.StripeService(gh<_i269.ApiFactory>()));
    gh.factory<_i553.CheckoutRepo>(() => _i553.CheckoutRepo(
          gh<_i619.StripeService>(),
          gh<_i973.InternetConnectionChecker>(),
        ));
    return this;
  }
}

class _$PackageModule extends _i611.PackageModule {}
