import 'package:finailtask/API/controllers/registration_controller.dart';
import 'package:finailtask/API/controllers/request_project_controller.dart';
import 'package:finailtask/API/controllers/user_controller.dart';
import 'package:finailtask/API/models/auth/user.dart';
import 'package:finailtask/API/models/posts/post_user.dart';
import 'package:finailtask/caching/sharedPrefs.dart';
import 'package:finailtask/pages/forms/requests_project.dart';
import 'package:finailtask/router.dart';
import 'package:finailtask/widgets/post/post_widget.dart';
import 'package:finailtask/widgets/post/search_section.dart';
import 'package:finailtask/widgets/template.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../API/controllers/feed_controller.dart';
import 'package:get/get.dart';

// import '/caching/sharedPrefs.dart';

class HomeView extends StatefulWidget {
  HomeView({super.key});

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<PostUser> posts = [];

  UserController userController = Get.find();
  var feedControllerInit = Get.lazyPut(() => FeedController());
  FeedController feedController = Get.find();
  Users user = Users();
  RequestsProjectController requestsProjectForm =
      Get.put(RequestsProjectController());

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  /// Helper method to handle asynchronous initialization
  Future<void> _initialize() async {
    if (!isInpordingFinished()) {
      Get.toNamed("/inpording");
    } else {
      if (SharedPrefs().getMap("auth")?.isEmpty ?? true) {
        Get.toNamed(AppRouter.login);
      } else {
        var authData = SharedPrefs().getMap("auth");
        if (authData != null) {
          user = Users.fromJson(authData);

          // Use post-frame callback to set user after build phase
          WidgetsBinding.instance.addPostFrameCallback((_) {
            userController.setUser(user);
            user = userController.getUser();
            getFeed();
          });
        }
      }
    }
  }

  /// Method to fetch feed and update state
  Future<void> getFeed() async {
    var response = await feedController.getFeed();
    print(response);
    if (response != null) {
      feedController.setResults(response);
      posts = response;
    }
  }

  /// Method to check onboarding status
  bool isInpordingFinished() {
    return SharedPrefs().getString("inpording") == "Done";
  }

  @override
  Widget build(BuildContext context) {
    return Template(
      child: ListView(
        children: [
          Center(
            child: Column(
              children: [
                SearchSection(),
                SizedBox(
                  height: context.height * 0.7,
                  child: RefreshIndicator(
                    onRefresh: () async {
                      print(posts);
                      await getFeed();
                    },
                    child: FutureBuilder(
                      future: feedController.getFeed(),
                      builder: (context, snapshot) {
                        return ListView.builder(
                          itemCount: posts.length,
                          itemBuilder: (context, index) {
                            var post = posts[index];
                            return PostWidget(
                              key: Key(post.id.toString()),
                              imageUrl: post.imageUrl,
                              user: post,
                              title: post.name ?? '',
                              description: post.description ?? '',
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
