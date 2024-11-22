import 'package:dio/dio.dart';

class BaseRequests {
  Dio dio = Dio(
    BaseOptions(
      baseUrl: "http://13.60.35.174/api/mobile/v1/",
      headers: {
        "Content-Type": "application/json",
      },
    ),
  );


  BaseRequests();

  void setHeaders(String token){
    dio.options.headers['Authorization'] = 'Bearer $token';
  }

  Future<Response> post(String url,
      {required Map<String, dynamic> data , String? token}) async {
    try {
      print(token);
      final response = await dio.post(
        url, data: data , options: Options(
          headers: {
            "Content-Type": "application/json",
            "Authorization":"Bearer $token"
          },
        ),
      );
      return response;
    } on DioException catch (e) {
      if (e.response != null) {
        // Server responded with an error
        throw Exception("Server error: ${e.response?.statusCode}");
      } else {
        // Request failed before reaching the server
        throw Exception("Request error: ${e.message}");
      }
    }
  }

  Future<Response> get(String url, {String? token}) async {
    print(url);
    try {
      final response = await dio.get(
        url,
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Authorization":"Bearer $token"
          },
        ),
      );
      return response;
    } on DioException catch (e) {
      if (e.response != null) {
        // Server responded with an error
        throw Exception("Server error: ${e.response?.statusCode}");
      } else {
        // Request failed before reaching the server
        throw Exception("Request error: ${e.message}");
      }
    }
  }

}
