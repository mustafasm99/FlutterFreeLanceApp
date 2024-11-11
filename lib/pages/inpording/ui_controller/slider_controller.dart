import 'package:get/get.dart';

class sliderController extends GetxController {
  var currentPage = 0.obs;
  var isLastPage = false.obs;
  var isUserTypeSelected = false.obs;
  var selectedOption = ''.obs;

  void updateCurrentPage(int page) {
    currentPage.value = page;
  }

  void updateIsLastPage(bool isLast) {
    isLastPage.value = isLast;
  }

  void updateIsUserTypeSelected(bool isSelected) {
    isUserTypeSelected.value = isSelected;
  }

  void updateSelectedOption(String option) {
    selectedOption.value = option;
  }
}