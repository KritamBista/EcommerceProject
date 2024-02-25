import 'package:dio/dio.dart';

class Api {
  static final Dio dio = Dio(
    BaseOptions(baseUrl: "http://ecommerce.codeitapps.com/api/", headers: {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    }),
  );
}
