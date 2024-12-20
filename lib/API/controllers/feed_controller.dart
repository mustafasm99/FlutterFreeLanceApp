import 'package:get/get.dart';
import './../models/posts/post_user.dart';
import '../base/base_requests.dart';
import '../../caching/sharedPrefs.dart';
import 'package:dio/dio.dart';
class FeedController extends GetxController {
  var results = <PostUser>[].obs;
  var isSuccess = false.obs;
  String token = SharedPrefs().getString("token") ?? ''; // Default to an empty string if token is null

  void setResults(List<PostUser> results) {
    this.results.assignAll(results);
  }

  Future<List<PostUser>?> getFeed() async {
    print(token);
    if (token.isEmpty) {
      print("token is empty");
      // Handle the case where token is empty, such as showing an error message or redirecting
      isSuccess.value = false;
      return null;
    }
    Dio dio = Dio(
      BaseOptions(
        baseUrl: "http://16.170.247.41/api/web/v1/",
        headers: {
          "Content-Type": "application/json",
          "Authorization" : "Bearer $token"
        },
        )
    );
    var response = await dio.get(
      "projects/freelancerfeed?page=0&pageSize=8",
    );
    if (response.statusCode == 200) {
      isSuccess.value = true;
      
      return (response.data["results"]?["result"] as List)
          .map((e) => PostUser.fromJson(e))
          .toList();
    } else {
      isSuccess.value = false;
      return null;
    }
  }
}
