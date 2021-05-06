import 'package:dio/dio.dart';

final _baseUrl = 'https://phone-book-api.herokuapp.com/';

Dio _dioClient() {
  BaseOptions options = BaseOptions(
    baseUrl: _baseUrl,
    headers: {
      'Accept': 'application/json',
    },
  );

  Dio dio = Dio(options);

  return dio;
}

Dio httpClient = _dioClient();
