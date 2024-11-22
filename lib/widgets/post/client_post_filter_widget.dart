import 'package:finailtask/API/controllers/post_filter_controller.dart';
import 'package:finailtask/extentions/theme_extentions.dart';
import 'package:finailtask/pages/projects/widgets/line.dart';
import 'package:finailtask/widgets/post/filter_selection.dart';
import 'package:finailtask/widgets/post/post_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClientPostFilterWidget extends StatelessWidget {
  ClientPostFilterWidget({super.key});
  PostController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * 0.35,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: 1,
            blurRadius: 8,
            offset: Offset(0, 3),
          )
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.close,
              color: context.fontColor,
            ),
          ),
          Obx(
            () => FilterSelection(
              text: 'Back End',
              value: controller.backendFilter.value,
              onChanged: (value) {
                controller.backendFilter.value = value!;
              },
            ),
          ),
          Obx(
            () => FilterSelection(
              text: 'Front End',
              value: controller.frontendFilter.value,
              onChanged: (value) {
                controller.frontendFilter.value = value!;
              },
            ),
          ),
          Obx(
            () => FilterSelection(
              text: 'UI/UX',
              value: controller.uiUx.value,
              onChanged: (value) {
                controller.uiUx.value = value!;
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  controller.backendFilter.value = false;
                  controller.frontendFilter.value = false;
                  controller.uiUx.value = false;
                },
                child: Container(
                  width: context.width * 0.4,
                  alignment: Alignment.center,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: context.primaryDark,
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text(
                    'Cancel Sort',
                    style: TextStyle(
                      color: context.primaryDark,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  // apply filter and logic with backend
                },
                child: Container(
                  width: context.width * 0.4,
                  alignment: Alignment.center,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
                  decoration: BoxDecoration(
                    color: context.primaryDark,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Text(
                    'Apply',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class FreelancerFilterWidget extends StatelessWidget {
  FreelancerFilterWidget({super.key});
  // from the back end list of filters
  final List<String> filters = [
    'Back-End',
    'Front-End',
    'UI/UX',
    'Mobile',
  ];
  PostFilterController controller = Get.put(PostFilterController());
  TextEditingController timelineController = TextEditingController();
  TextEditingController timelineTypeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    InputDecorationTheme selectionDecoration = InputDecorationTheme(
      fillColor: Colors.white,
      filled: true,
      contentPadding: const EdgeInsets.symmetric(horizontal: 20),
      hintFadeDuration: const Duration(milliseconds: 100),
      hintStyle: TextStyle(
        color: context.primaryDark,
        fontSize: 16,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: context.primaryColor, width: 1),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.white, width: 1),
      ),
    );

    InputDecoration inputDecoration = InputDecoration(
      fillColor: Colors.white,
      filled: true,
      contentPadding: const EdgeInsets.symmetric(horizontal: 20),
      hintFadeDuration: const Duration(milliseconds: 100),
      hintStyle: TextStyle(
        color: context.primaryDark,
        fontSize: 16,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: context.primaryColor, width: 1),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.white, width: 1),
      ),
    );

    return Container(
      width: context.width,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            // for the close button and the title
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.close,
                  color: context.fontColor,
                ),
              ),
              const Text(
                "Filter Projects",
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 10),
            ],
          ),
          // for the filters
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
            child: Obx(
              () => Wrap(
                spacing: 20,
                runSpacing: 20,
                children: filters
                    .map(
                      (filter) => GestureDetector(
                        onTap: () => controller.addFilter(filter),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 8),
                          decoration: BoxDecoration(
                            color: controller.isActiveFilter(filter)
                                ? context.unActive
                                : context.primaryColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            filter,
                            style: TextStyle(
                              color: controller.isActiveFilter(filter)
                                  ? context.fontColor
                                  : Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
          const PageLine(),
          Text(
            "Time Line",
            style: TextStyle(
              color: context.fontColor,
              fontSize: 20,
              fontWeight: FontWeight.normal,
            ),
          ),
          // Row for the time line inputs
          Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // First Dropdown: Timeline Type
                DropdownMenu(
                  controller: timelineTypeController,
                  inputDecorationTheme: selectionDecoration,
                  dropdownMenuEntries: controller.timelineType,
                  initialSelection: controller.selectedTimelineType.value,
                  onSelected: (value) {
                    controller.selectedTimelineType.value = value!;
                    controller.updateTimelineOptions(
                        value); // Update second dropdown options
                  },
                ),

                // Second Dropdown: Timeline Values
                DropdownMenu(
                  controller: timelineController,
                  inputDecorationTheme: selectionDecoration,
                  dropdownMenuEntries: controller.timelineOptions,
                  initialSelection: controller.selectedTimelineValue.value,
                  onSelected: (value) {
                    controller.selectedTimelineValue.value = value!;
                  },
                ),
              ],
            ),
          ),
          const PageLine(),
          const SizedBox(height: 10),
          Text(
            "Price Range",
            style: TextStyle(
              color: context.fontColor,
              fontSize: 20,
              fontWeight: FontWeight.normal,
            ),
          ),
          const SizedBox(height: 10),

          Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  width: context.width * 0.35,
                  child: TextFormField(
                    controller: TextEditingController(
                      text: controller.currentRangeValue.value.start.round().toString(),
                    ),
                    textAlign: TextAlign.center,
                    decoration: inputDecoration,
                    onChanged: (value) {
                      final newValue = double.tryParse(value) ?? 0;
                      controller.currentRangeValue.value = RangeValues(
                        controller.currentRangeValue.value.start,
                        newValue,
                      );
                    },
                  ),
                ),
                Text(
                  "To",
                  style: TextStyle(
                    color: context.fontColor,
                    fontSize: 16,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  width: context.width * 0.35,
                  child: TextFormField(
                    controller: TextEditingController(
                      text: controller.currentRangeValue.value.end.round().toString(),
                    ),
                    textAlign: TextAlign.center,
                    decoration: inputDecoration,
                    onChanged: (value) {
                      final newValue = double.tryParse(value) ?? 0;
                      controller.currentRangeValue.value = RangeValues(
                        newValue,
                        controller.currentRangeValue.value.end,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),

          const PageLine(),
          const SizedBox(height: 10),
          Obx(
            () => RangeSlider(
              values: controller.currentRangeValue.value,
              onChanged: (value) {
                controller.currentRangeValue.value = value;
              },
              max: 1000,
              min: 0,
              divisions: 100,
              activeColor: context.primaryColor,
              inactiveColor: context.fontColor,
              labels: RangeLabels(
                "${controller.currentRangeValue.value.start.round().toString()}\$",
                "${controller.currentRangeValue.value.end.round().toString()} \$",
              ),
            ),
          ),
          Row(
            // for the two buttons at the filters
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {},
                child: Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  width: context.width * 0.45,
                  height: 55,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: context.primaryDark,
                      width: 2,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Cancel Filter',
                      style: TextStyle(
                        color: context.primaryDark,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  width: context.width * 0.45,
                  height: 55,
                  decoration: BoxDecoration(
                    color: context.primaryDark,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Center(
                    child: Text(
                      'Apply',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
