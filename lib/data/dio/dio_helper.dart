import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

//https://newsapi.org/
//v2/top-headlines
//?country=eg&category=business&apiKey=2251758ef79d4c57ae3c6d0336ab58c7
class DioHelper {
  static Dio? dio;
  static void init() {
    dio = Dio(BaseOptions(
      baseUrl: 'https://newsapi.org/',
      receiveDataWhenStatusError: true,
    ));
  }

  static Future<Response<dynamic>>? getData({
    @required String? method,
    @required Map<String, dynamic>? query,
  }) {
    return dio!.get(method!, queryParameters: query);
  }
}

