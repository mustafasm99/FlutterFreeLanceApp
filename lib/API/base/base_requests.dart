import 'package:dio/dio.dart';

class BaseRequests {
  String baseUrl = 'http://13.60.35.174/api/mobile/v1/';
  Dio dio = Dio();

  void init() {
    dio.options.baseUrl = baseUrl;
    dio.options.connectTimeout = const Duration(seconds: 5);
    dio.options.receiveTimeout = const Duration(milliseconds: 3000);
  }

  BaseRequests();

  Future<Response> post(String url,
      {required Map<String, dynamic> data}) async {
    print("POST: data ==========>");
    print(data);
    try {
      final response = await dio.post(
        url, data: data
      );
      return response;
    } on DioException catch (e) {
      if (e.response != null) {
        // Server responded with an error
        throw Exception("Server error: ${e.response?.data}");
      } else {
        // Request failed before reaching the server
        throw Exception("Request error: ${e.message}");
      }
    }
  }
}
