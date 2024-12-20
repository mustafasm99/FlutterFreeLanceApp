import 'package:get/get.dart';
import '../models/posts/post_user.dart';

class RequestsProjectController extends GetxController {
  PostUser? selectedPost;
  RxString name = "".obs;
  RxString email = "".obs;
  RxString specialization = "".obs;
  RxString note = "".obs;


}