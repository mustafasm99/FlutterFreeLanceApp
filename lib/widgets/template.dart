import 'package:finailtask/extentions/theme_extentions.dart';
import 'package:finailtask/navigation/bottom_nav.dart';
import 'package:finailtask/navigation/top_nav.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Template extends StatelessWidget {
  final Widget child;
  final Widget? freeSpace;
  final Widget? bottomNavigationBar;
  bool? havFloatingButton = true;
  
  Template(
    {
      super.key ,
      required this.child,
      this.freeSpace,
      this.bottomNavigationBar,
      this.havFloatingButton = true,
    }
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:TopNavigationBar(
        freeSpace: freeSpace,
      ),
      body: child,
      bottomNavigationBar: bottomNavigationBar ?? AppBottomNavigationBar(),
      floatingActionButton:(havFloatingButton ?? false) ? GestureDetector(
        onTap: () {
          Get.offNamed('/create-project');
        },
        child: Container(
          height: 60,
          width: 60,
          decoration:const  BoxDecoration(
            color: Color.fromRGBO(82, 146, 175, 1),
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
              color: Color.fromRGBO(255, 255, 255, 1),
              spreadRadius: 1,
              blurRadius: 8,
              offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: const Icon(
            Icons.add,
            color: Colors.white,
            size: 30,
          ),
        ),
      ):null ,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}