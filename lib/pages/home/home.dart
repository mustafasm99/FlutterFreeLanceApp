import 'package:finailtask/API/models/posts/post_user.dart';
import 'package:finailtask/widgets/post/post_widget.dart';
import 'package:finailtask/widgets/post/search_section.dart';
import 'package:finailtask/widgets/template.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Template(
      child: Center(
        child: Column(
          children: [
            SearchSection(),
            SizedBox(
              height: context.height * 0.7,
              child: ListView(
                children: [
                  PostWidget(
                    user: PostUser(
                      name: "Mustafa Said",
                      date: "12/12/2021",
                      imageUrl:
                          "https://media.licdn.com/dms/image/D4D12AQGkhVu2gh8X6g/article-cover_image-shrink_600_2000/0/1716287814954?e=2147483647&v=beta&t=ED8s7ACPwHL_6r9e_9SsHwqzrqpG_1Gkng8sPu7umPo",
                      status: 0,
                    ),
                    title:
                        "Looking for Full-Sack Developer with experience +2 years",
                    description:
                        "to build a responsive, user-focused web application. Must be skilled in both front-end and back-end development and have experience with React, Node.js, and Express.js.",
                    imageUrl:
                        "https://sm.pcmag.com/t/pcmag_uk/news/l/learn-codi/learn-coding-basics-for-just-1-with-this-humble-bundle_ptgc.1920.jpg",
                  ),
                  PostWidget(
                    user: PostUser(
                      name: "Ahmed Ali",
                      date: "12/12/2021",
                      imageUrl:
                          "https://the-cs.org/static/media/TCS-logo.6487b75be624f930573f.png",
                      status: 1,
                    ),
                    title:
                        "Looking for Full-Sack Developer with experience +2 years",
                    description:
                        "to build a responsive, user-focused web application. Must be skilled in both front-end and back-end development and have experience with React, Node.js, and Express.js.",
                    imageUrl:
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_akWp9wSp25hnck2oANi0IKyLMMZqrR8iDQ&s",
                  ),
                  PostWidget(
                    user: PostUser(
                      name: "Mustafa Said",
                      date: "12/12/2021",
                      imageUrl:
                          "https://www.outsourcestrategies.com/wp-content/uploads/2024/02/computer-assisted-coding.jpg",
                      status: 0,
                    ),
                    title:
                        "Looking for Full-Sack Developer with experience +2 years",
                    description:
                        "to build a responsive, user-focused web application. Must be skilled in both front-end and back-end development and have experience with React, Node.js, and Express.js.",
                    imageUrl:
                        "https://cdn.activestate.com/wp-content/uploads/2021/12/python-coding-mistakes.jpg",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
