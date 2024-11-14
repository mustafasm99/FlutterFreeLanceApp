import 'package:get/get.dart';


class DropListController  extends GetxController{
  RxList<String> dropList = [
    "Select option",
    "UI/UX Designer",
    "Frontend Developer",
    "Backend Developer",
    "Fullstack Developer",
    "Mobile Developer",
  ].obs;
  var currentValue = "".obs;
  DropListController(){
    currentValue.value = dropList.first;
  }

  void setCurrentValue(String? value){
    currentValue.value = value ?? currentValue.value;
  }



}