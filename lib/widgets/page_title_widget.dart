import 'package:finailtask/extentions/theme_extentions.dart';
import 'package:finailtask/util/icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageTitle extends StatelessWidget {
  final String title;
  const PageTitle({super.key , required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 24),
      width: double.infinity,
      // margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 24),
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children:[
          IconButton(onPressed: (){
              Get.back();
          },
           icon: ProjectIcons.arrowLeft()),
          Text(
            title,
            style:TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              fontFamily: context.fontFamily,
            ),
          ),
        ]
      ),
    );
  }
}
