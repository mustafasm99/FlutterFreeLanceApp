import 'package:get/get.dart';


class PostController extends GetxController {
  RxBool expanded = false.obs;
  RxBool backendFilter = false.obs;
  RxBool frontendFilter = false.obs;
  RxBool uiUx = false.obs;
}

class CheckBoxController extends GetxController {
  RxBool state = false.obs;

  void changeState() {
    state.value = !state.value;
  }

  void resetState() {
    state.value = false;
  }
}
