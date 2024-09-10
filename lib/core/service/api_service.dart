import 'dart:convert';

import 'package:dio/dio.dart';

class ApiService {
  final Dio dio;

  ApiService(this.dio);

  static const baseUrl = "https://daralbanat.com/wp-json/wc/v3/";
  static const consumerKey = "ck_b88368a6faeb43f8cb0fbde55df78803c562ac30";
  static const secretKey = "cs_a3799272ff2c9f8e8784ecd882c3776566678be7";

  Future<List<dynamic>> get(String endPoint) async {
    var response = await dio.get(baseUrl + endPoint,
        options: Options(
          headers: {
            // Encode credentials to Base64
            'Authorization':
                'Basic ${base64Encode(utf8.encode('$consumerKey:$secretKey'))}',
          },
        ));
    return response.data;
  }
}
