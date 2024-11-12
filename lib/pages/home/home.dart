import 'package:finailtask/widgets/template.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Template(
      imageUrl: "https://img.freepik.com/free-photo/young-tender-curly-girl-holding-documents_176420-238.jpg",
      name: "Mustafa Said",
      userType: "Client",
      child:const Center(child:Text("Home")),
    );
  }
}