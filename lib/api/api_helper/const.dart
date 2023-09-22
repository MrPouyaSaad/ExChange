import 'package:dio/dio.dart';

final httpClient = Dio(
  BaseOptions(
    baseUrl: baseUrl + '/',
    headers: {
      'authorization': {
        '60d4773324a3877bab7c80e910a706c06d7b8c47ba8841ddba1a3d171ef93ffe'
      }
    },
  ),
);

final baseUrl = 'https://min-api.cryptocompare.com/data';
