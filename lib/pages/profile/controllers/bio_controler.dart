import 'package:get/get.dart';

class BioController extends GetxController {
  final RxString bio = "".obs;
  final RxBool isEdit = false.obs;
  final RxBool isExpanded = false.obs;
  final RxBool isLongText = false.obs;
  
  BioController({required String bio}) {
    this.bio.value = bio;
    if (bio.length > 200) {
      isLongText.value = true;
    }
  }

  void setBio(String bio) {
    this.bio.value = bio;
  }
}