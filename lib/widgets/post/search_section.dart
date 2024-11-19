import 'package:finailtask/extentions/theme_extentions.dart';
import 'package:finailtask/util/icons.dart';
import 'package:finailtask/widgets/full_screen_button.dart';
import 'package:finailtask/widgets/post/filter_selection.dart';
import 'package:finailtask/widgets/post/post_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchSection extends StatelessWidget {
  SearchSection({super.key});
  PostController controller = Get.put(PostController());
  var temp_list = [];
  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width * 0.9,
      height: 100,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                prefixIcon: ProjectIcons.search(
                  color: context.fontColor,
                  size: 16,
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                hintText: 'Search',
                hintStyle: TextStyle(
                  color: context.fontColor,
                  fontSize: 16,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.white, width: 1),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.white, width: 1),
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[300]!,
                  spreadRadius: 1,
                  blurRadius: 8,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: IconButton(
                onPressed: () {
                  showModalBottomSheet(
                    // button sheet page
                    context: context,
                    builder: (BuildContext context) {
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 8),
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
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5, vertical: 20),
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
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5, vertical: 20),
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
                    },
                  );
                },
                icon: ProjectIcons.filterHorizontal(
                  color: context.fontColor,
                  size: 25,
                )),
          ),
        ],
      ),
    );
  }
}
