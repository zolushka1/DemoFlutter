import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:demo/Utilities/Storage.dart';

class Common {
  static final Common _instance = Common._internal();
  static var navigatorKey = GlobalKey<NavigatorState>();

  factory Common() => _instance;

  Common._internal();

  Dio client = _createDioInstance();

  static Dio _createDioInstance() {
    Dio dio = Dio();
    // adding interceptor
    dio.interceptors.clear();
    dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      return handler.next(options); //modify your request
    }, onResponse: (response, handler) {
      return handler.next(response);
    }, onError: (DioError e, handler) async {
      if (e.response == null) return;
      int? statusCode = e.response?.statusCode;
      if (statusCode == 401 || statusCode == 403) {
        print('logout please... $statusCode');
        // Navigator.po
        navigatorKey?.currentState?.pushNamed("/");
        await Storage().secureStorage.write(key: 'access_token', value: null);

        return null;
      } else {
        handler.next(e);
      }
    }));
    return dio;
  }
}
