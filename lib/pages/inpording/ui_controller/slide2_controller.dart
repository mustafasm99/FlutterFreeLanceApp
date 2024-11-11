import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Slide2Controller extends GetxController {
  final _currentPage = 0.obs;
  final _isLastPage = false.obs;
  final TextEditingController PhoneNumberController = TextEditingController();
  final TextEditingController OtpController = TextEditingController();

  int get currentPage => _currentPage.value;
  bool get isLastPage => _isLastPage.value;

  void onPageChanged(int page) {
    _currentPage.value = page;
    _isLastPage.value = page == 2;
  }

  
}