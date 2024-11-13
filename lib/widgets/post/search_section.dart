import 'package:finailtask/extentions/theme_extentions.dart';
import 'package:finailtask/util/icons.dart';
import 'package:finailtask/widgets/post/filter_selection.dart';
import 'package:finailtask/widgets/post/post_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchSection extends StatelessWidget {
  SearchSection({super.key});
  PostController controller = Get.put(PostController());

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
                  showBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        height: 200,
                        color: Colors.white,
                        child: Column(
                          children: [
                            FilterSelection(
                              text: 'Back End',
                              controller: CheckBoxController(),
                            ),
                            FilterSelection(
                              text: 'Front End',
                              controller: CheckBoxController(),
                            ),
                            FilterSelection(
                              text: 'Ui/Ux',
                              controller: CheckBoxController(),
                            ),
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
