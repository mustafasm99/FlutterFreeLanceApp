import 'package:finailtask/extentions/theme_extentions.dart';
import 'package:finailtask/util/icons.dart';
import 'package:flutter/material.dart';

class SectionHolder extends StatelessWidget {
  final String title;
  void Function() onAdd;
  void Function() onEdit;
  Widget child;

  SectionHolder({
    super.key,
    required this.title,
    required this.onAdd,
    required this.onEdit,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.symmetric(horizontal: 10 , vertical: 10),
      margin: const EdgeInsets.symmetric(vertical: 10 , horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: context.hoverColor,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Row(
                children: [
                  IconButton(
                    icon:const  Icon(Icons.add),
                    onPressed: onAdd,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  IconButton(
                    icon: ProjectIcons.edit(),
                    onPressed: onEdit,
                  ),
                ],
              ),
            ],
          ),
          child,
        ],
      ),
    );
  }
}
