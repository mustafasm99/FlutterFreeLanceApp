import 'package:finailtask/widgets/full_screen_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/widgets.dart';


class sliderController extends GetxController {
  var currentPage = 0.obs;
  var isLastPage = false.obs;
  var isUserTypeSelected = false.obs;
  var selectedOption = ''.obs;
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