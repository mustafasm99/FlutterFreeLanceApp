import 'package:cached_network_image/cached_network_image.dart';
import 'package:finailtask/API/controllers/request_project_controller.dart';
import 'package:finailtask/API/models/posts/post_user.dart';
import 'package:finailtask/extentions/theme_extentions.dart';
import 'package:finailtask/widgets/page_title_widget.dart';
import 'package:finailtask/widgets/template.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../API/controllers/user_controller.dart';

class RequestsProjectForm extends StatelessWidget {
  RequestsProjectForm({super.key});
  RequestsProjectController requestsProjectForm = Get.find();
  UserController user = Get.find();
  @override
  Widget build(BuildContext context) {
    PostUser? post = requestsProjectForm.selectedPost;

    return Template(
        freeSpace: const PageTitle(title: ""),
        child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey[200],
            ),
            child: post?.imageUrl != null
                ? CachedNetworkImage(
                    imageUrl: post?.imageUrl ?? "",
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  )
                : const Icon(Icons.image_not_supported),
          ),
          Text(
            post?.name ?? "",
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextFormField(
            initialValue: user.getUser().name ?? "",
            decoration: InputDecoration(
                labelText: 'Name*',
                enabledBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: context.primaryColor, width: 2),
                ),
                border: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: context.primaryColor, width: 2),
                )),
          ),
          TextFormField(
            initialValue: user.getUser().email ?? "",
            decoration: InputDecoration(
                labelText: 'Email*',
                enabledBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: context.primaryColor, width: 2),
                ),
                border: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: context.primaryColor, width: 2),
                )),
          ),
          TextFormField(
            initialValue: "",
            decoration: InputDecoration(
                labelText: 'Specialization',
                enabledBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: context.primaryColor, width: 2),
                ),
                border: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: context.primaryColor, width: 2),
                )),
          ),
          TextFormField(
            maxLines: 5,
            decoration: InputDecoration(
                labelText: 'Note',
                enabledBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: context.primaryColor, width: 2),
                ),
                border: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: context.primaryColor, width: 2),
                )),
          ),
          GestureDetector(
            onTap: () {
              // requestsProjectForm.sendRequest();
            },
            child: Container(
              width: double.infinity,
              height: 70,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: context.primaryDark,
                borderRadius: BorderRadius.circular(25),
              ),
              child: const Center(
                child: Text(
                  "Apply Now",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
