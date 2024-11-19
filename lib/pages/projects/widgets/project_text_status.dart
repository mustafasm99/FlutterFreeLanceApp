import 'package:finailtask/extentions/theme_extentions.dart';
import 'package:finailtask/pages/dashbord/widgets/project_status.dart';
import 'package:finailtask/pages/dashbord/widgets/task_charts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProjectTextStatus extends StatelessWidget {
  final ProjectStatus status;
  final String label;
  String? title;
  Color? titleColor;
  Color? labelColor;

  Color get statusColor {
    switch (status) {
      case ProjectStatus.inProgress:
        return Get.context!.pendingColor;
      case ProjectStatus.completed:
        return Get.context!.primaryDark;
      case ProjectStatus.pending:
        return Get.context!.primaryColor;
      default:
        return Get.context!.primaryColor;
    }
  }
  String get statusText {
    switch (status) {
      case ProjectStatus.inProgress:
        return 'In Progress';
      case ProjectStatus.completed:
        return 'Completed';
      case ProjectStatus.pending:
        return 'Pending';
      default:
        return 'Pending';
    }
  }
  ProjectTextStatus({super.key, required this.status , required this.label , this.labelColor , this.title , this.titleColor});

  @override
  Widget build(BuildContext context) {


    return SizedBox(
      width: context.width * 0.45,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: statusColor,
            ),
          ),
          const SizedBox(width: 5),
          Text(
            "$label: ",
            style:TextStyle(
              fontSize: 16,
              color: labelColor ?? Colors.black,
            ),
          ),
          const SizedBox(width: 5),
          Text(
            (title ?? statusText),
            style: TextStyle(
              color: titleColor ?? statusColor,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
