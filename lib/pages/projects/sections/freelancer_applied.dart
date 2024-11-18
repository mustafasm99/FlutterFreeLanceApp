import 'package:finailtask/pages/projects/widgets/request_sended.dart';
import 'package:flutter/material.dart';

class FreelancerApplied extends StatelessWidget {
  FreelancerApplied({super.key});
  int numberOfRequests = 3;
  // This widget is used to display the freelancer who applied for the project
  // The freelancer's name, profile picture, and the time they applied for the project are displayed
  // Step 1:
  // send request to get all the users form the backend
  // Step 2: 
  // display the users in a list view
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$numberOfRequests Freelancers Applied',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          RequestSended(),
          RequestSended(),
          RequestSended(),
        ],
      ),
    );
  }
}