import 'package:finailtask/API/models/projects/task_model.dart';
import 'package:finailtask/extentions/theme_extentions.dart';
import 'package:finailtask/pages/projects/sections/task_tab_bars.dart';
import 'package:finailtask/util/icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TaskWidget extends StatelessWidget {
  final Task task;

  RxBool isSelected = false.obs;
  TaskWidget({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              task.status == TaskStatus.inReview.index
                  ? Obx(
                      () => Checkbox(
                        activeColor: Colors.green[400]!,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        side: BorderSide(color: context.fontColor),
                        value: task.status == TaskStatus.done.index
                            ? true
                            : isSelected.value,
                        onChanged: (value) {
                          isSelected.value = value!;
                        },
                      ),
                    )
                  : task.status == TaskStatus.done.index
                      ? Checkbox(
                          activeColor: Colors.green[400]!,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          side: BorderSide(color: context.fontColor),
                          value: true,
                          onChanged: (value) {
                            isSelected.value = value!;
                          },
                        )
                      : const SizedBox(),
              if (task.status == TaskStatus.inReview.index)
                Obx(
                  () {
                    print(isSelected.value);
                    return Text(
                      task.title,
                      style: TextStyle(
                        fontSize: 16,
                        decoration: isSelected.value
                            ? TextDecoration.lineThrough
                            : null,
                        fontWeight: FontWeight.w500,
                        color: isSelected.value
                            ? context.fontColor
                            : Colors.black,
                      ),
                    );
                  },
                )
              else
                Text(
                  task.title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    decoration: task.status == TaskStatus.done.index
                        ? TextDecoration.lineThrough
                        : null,
                    fontWeight: FontWeight.w500,
                  ),
                ),
            ],
          ),
          task.status == TaskStatus.toDo.index
              ? Row(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: ProjectIcons.messageEdit(
                          color: context.pendingColor,
                          size: 24,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: ProjectIcons.trash(
                          color: Colors.red,
                          size: 24,
                        ))
                  ],
                )
              : const SizedBox()
        ],
      ),
    );
  }
}
