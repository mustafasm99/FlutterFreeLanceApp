import 'package:finailtask/extentions/theme_extentions.dart';
import 'package:finailtask/navigation/bottom_nav.dart';
import 'package:finailtask/navigation/top_nav.dart';
import 'package:flutter/material.dart';

class Template extends StatelessWidget {
  final Widget child;
  final String imageUrl,name,userType;
  Template(
    {
      super.key ,
      required this.child,
      required this.imageUrl,
      required this.name,
      required this.userType
    }
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:TopNavigationBar(
        imageUrl: imageUrl,
        name: name,
        userType: userType,
      ),
      body: child,
      bottomNavigationBar: AppBottomNavigationBar(),
      floatingActionButton: GestureDetector(
        onTap: () {},
        child: Container(
          height: 60,
          width: 60,
          decoration:const  BoxDecoration(
            color:  Color.fromARGB(255, 82, 146, 175),
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
              color: Color.fromARGB(255, 255, 255, 255),
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
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}