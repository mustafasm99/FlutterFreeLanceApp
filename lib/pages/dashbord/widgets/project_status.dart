import 'package:flutter/material.dart';

enum ProjectStatus{
  inProgress,
  completed,
  pending,
}


class ProjectStatusWidget extends StatelessWidget {
  final ProjectStatus status;
  const ProjectStatusWidget({super.key , required this.status});
  

  Color get color{
    switch (status) {
      case ProjectStatus.inProgress:
        return Colors.yellow[100]!;
      case ProjectStatus.completed:
        return Colors.green[100]!;
      case ProjectStatus.pending:
        return Colors.red[100]!;
      default:
        return Colors.red[100]!;
    }
  }

  Color get textColor {
    switch (status) {
      case ProjectStatus.inProgress:
        return Colors.yellow[700]!;
      case ProjectStatus.completed:
        return Colors.green[700]!;
      case ProjectStatus.pending:
        return Colors.red[700]!;
      default:
        return Colors.red[700]!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10 , vertical: 5),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        status == ProjectStatus.inProgress ? 'In Progress' : 
        status == ProjectStatus.completed ? 'Completed' : 'Pending',
        style: TextStyle(
          fontSize: 16,
          color: textColor,
        ),
      ),
    );
  }
}