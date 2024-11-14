import 'package:get/get.dart';

class CreateProjectSliderController extends GetxController {
  final RxInt currentIndex = 0.obs;
  final RxInt totalIndex = 0.obs;

  void setIndex(int index) {
    currentIndex.value = index;
  }

  void setTotalIndex(int index) {
    totalIndex.value = index;
  }
}