import 'package:get/get.dart';

class NavController extends GetxController {
  var currentPage = 0.obs;

  void changeSlider(int index) {
    currentPage.value = index;
  }
}
