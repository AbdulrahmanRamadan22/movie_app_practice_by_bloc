import 'dart:developer';

import 'package:dio/dio.dart';
import '../../constants/stringes.dart';

class PopularApi {
  late Dio dio;

  PopularApi() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
    );

    dio = Dio(options);
  }

  Future<List<dynamic>> getAllPopular() async {
    try {
      Response response = await dio.get("movie/popular?api_key=$apiKey");

      log(response.data.toString());

          Map<String, dynamic> jsonData = response.data;

         List<dynamic> results = jsonData['results'];

      return results ;
    } catch (e) {
      log("++++++++++++++++++++++++++++++++++++++");
      log(e.toString());
      return [];
    }
  }
}
