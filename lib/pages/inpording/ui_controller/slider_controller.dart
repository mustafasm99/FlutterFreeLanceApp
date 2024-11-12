import 'package:finailtask/widgets/full_screen_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/widgets.dart';


class sliderController extends GetxController {
  RxInt currentPage = 0.obs;
  RxInt currentSlider = 0.obs;
  RxBool isLastPage = false.obs;
  RxBool isUserTypeSelected = false.obs;
  RxString selectedOption = ''.obs;
  RxBool isSliderActive = false.obs;
  Widget button = FullScreenButton(
    onPressed: (){},
    icon: null,
    inputText: 'Next',
    color: Colors.white,
    );

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