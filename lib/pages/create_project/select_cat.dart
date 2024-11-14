import 'package:finailtask/extentions/theme_extentions.dart';
import 'package:finailtask/pages/create_project/controller/drop_list_controller.dart';
import 'package:finailtask/util/icons.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class DropListSelectProjectType extends StatelessWidget {
  DropListSelectProjectType({super.key});
  var dropListController = DropListController();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(5),
        ),
        child: DropdownButtonHideUnderline(
          
          child: DropdownButton(
            value: dropListController.currentValue.value,
            style: TextStyle(
              color: dropListController.dropList
                          .indexOf(dropListController.currentValue.value) ==
                      0
                  ? context.fontColor
                  : Colors.black,
              fontSize: 24,
              
            ),
            icon: ProjectIcons.arrowDown(
              color: context.fontColor,
            ),
            items: dropListController.dropList.map((String value) {
              return DropdownMenuItem(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (value) {
              dropListController.setCurrentValue(
                dropListController
                    .dropList[dropListController.dropList.indexOf(value)],
              );
            },
          ),
        ),
      );
    });
  }
}
