import 'package:finailtask/API/base/base_requests.dart';
import 'package:finailtask/API/controllers/user_controller.dart';
import 'package:finailtask/API/models/profile/profile_model.dart';
import 'package:finailtask/API/models/projects/project_model.dart';
import 'package:get/get.dart';


class ProfileController extends GetxController {

  UserController get userController => Get.find<UserController>();
  var userProfile = ProfileModel().obs;

  Future<ProfileModel> getProfile()async{
    var user = userController.getUser();
    print(user.accessToken);
    BaseRequests baseRequests = BaseRequests();
    var response = await baseRequests.get("users/${user.id}/profile" , token:user.accessToken);
    return ProfileModel.fromJson(response.data);
  }

}