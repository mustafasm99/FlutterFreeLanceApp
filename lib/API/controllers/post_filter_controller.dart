import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostFilterController extends GetxController {

  var selectedFilters = <String>[].obs;
  var currentRangeValue = const RangeValues(0 , 1000).obs;

  void addFilter(String filter) {
    if (selectedFilters.contains(filter)) {
      selectedFilters.remove(filter);
    } else {
      selectedFilters.add(filter);
    }
  }

  bool isActiveFilter(String filter) {
    return selectedFilters.contains(filter);
  }

  // Observables for dropdown options and selected values
  var timelineType = <DropdownMenuEntry<String>>[
    const DropdownMenuEntry(value: "Day", label: "Day"),
    const DropdownMenuEntry(value: "Month", label: "Month"),
    const DropdownMenuEntry(value: "Year", label: "Year"),
  ].obs;

  var timelineDays = <DropdownMenuEntry<String>>[
    for (var i = 1; i <= 31; i++)
      DropdownMenuEntry(value: i.toString(), label: i.toString())
  ].obs;

  var timelineMonths = <DropdownMenuEntry<String>>[
    for (var i = 1; i <= 12; i++)
      DropdownMenuEntry(value: i.toString(), label: i.toString())
  ].obs;

  var timelineYears = <DropdownMenuEntry<String>>[
    for (var i = DateTime.now().year; i <= DateTime.now().year + 10; i++)
      DropdownMenuEntry(value: i.toString(), label: i.toString())
  ].obs;

  // Observables for selected values
  var selectedTimelineType = "Day".obs;
  var timelineOptions = <DropdownMenuEntry<String>>[].obs; // Dynamic dropdown options
  var selectedTimelineValue = "".obs;


  // TextEditingController startRangeController = TextEditingController(text: "0");
  // TextEditingController endRangeController = TextEditingController(text: "1000");


  @override
  void onInit() {
    super.onInit();
    timelineOptions.assignAll(timelineDays);
    selectedTimelineValue.value = timelineDays.first.value;


  }

  void updateTimelineOptions(String selectedType) {
    if (selectedType == "Day") {
      timelineOptions.assignAll(timelineDays);
      selectedTimelineValue.value = timelineDays.first.value;
    } else if (selectedType == "Month") {
      timelineOptions.assignAll(timelineMonths);
      selectedTimelineValue.value = timelineMonths.first.value;
    } else if (selectedType == "Year") {
      timelineOptions.assignAll(timelineYears);
      selectedTimelineValue.value = timelineYears.first.value;
    }
  }

  

}
