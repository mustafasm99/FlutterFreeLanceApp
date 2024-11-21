import 'package:finailtask/API/controllers/projects_controller.dart';
import 'package:finailtask/extentions/theme_extentions.dart';
import 'package:finailtask/pages/create_project/controller/create_project_slider_controller.dart';
import 'package:finailtask/pages/create_project/widgets/select_cat.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CreateProjectSlid1 extends StatelessWidget {
  CreateProjectSlid1({super.key});
  CreateProjectSliderController  createProjectSliderController = Get.put(CreateProjectSliderController());
  CreateProjectFormController createProjectFromController = Get.put(CreateProjectFormController());
  @override
  Widget build(BuildContext context) {
    // createProjectSliderController.setIndex(0);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 10),
      margin: const EdgeInsets.only(top: 10),
      child:Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Project Title",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
          TextFormField(
            onChanged:(value){
              createProjectFromController.title(value);
            },
            // add controller with the API to send the data to the backend
            decoration: InputDecoration(
              hintText: "Enter Project Title",
              // labelText: "Project Title",
              hintStyle: TextStyle(
                color: context.primaryColor,
                fontFamily: context.fontFamily,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(
                  color:context.primaryColor ,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(
                  color:context.fontColor ,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Select Required Qualifications",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          DropListSelectProjectType(),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            onChanged:(value){
              createProjectFromController.description(value);
            },
            // add controller with the API to send the data to the backend
            maxLines: 10,
            decoration: InputDecoration(
              
              hintText: "Enter Project Description",
              // labelText: "Project Description",
              hintStyle: TextStyle(
                color: context.primaryColor,
                fontFamily: context.fontFamily,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(
                  color:context.fontColor ,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(
                  color:context.fontColor ,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
