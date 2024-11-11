import 'package:finailtask/pages/inpording/impording_page.dart';
import 'package:finailtask/router.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:finailtask/themes/mainTheme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: mainTheme,
      getPages: AppPages.pages,
      initialRoute: AppRouter.home,
      home:const InpordingView(),
    );
  }
}
