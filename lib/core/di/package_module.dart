import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class PackageModule {
  Dio getDio() => Dio();
}
