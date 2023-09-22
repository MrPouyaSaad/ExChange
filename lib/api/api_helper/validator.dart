import 'package:dio/dio.dart';

mixin Validator {
  validaor(Response response) {
    if (response.statusCode != 200) {
      print(response.statusMessage);
    }
  }
}
