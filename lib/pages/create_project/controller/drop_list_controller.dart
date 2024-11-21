import 'package:get/get.dart';


class DropListController  extends GetxController{
  RxList<String> dropList = [
    "Select option",
    "uiux",
    "mobile",
    "frontend",
    "backend",
    "fullstack",
  ].obs;
  var currentValue = "".obs;
  DropListController(){
    currentValue.value = dropList.first;
  }

  void setCurrentValue(String? value){
    currentValue.value = value ?? currentValue.value;
  }



}