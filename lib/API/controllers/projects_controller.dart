import 'package:finailtask/API/base/base_requests.dart';
import 'package:finailtask/API/models/projects/project_model.dart';
import 'package:finailtask/caching/sharedPrefs.dart';
import 'package:get/get.dart';

class CreateProjectFormController extends GetxController {  

  final RxString title=''.obs , description=''.obs , qualificationName=''.obs , priceType=''.obs;
  final RxInt duration=0.obs , budget = 120.obs;

  Projects getProject(){
    return Projects(
      title: title.value,
      description: description.value,
      qualificationName: qualificationName.value,
      priceType: "Fixed",
      duration: duration.value,
      budget: budget.value,
    );
  }

  Future<bool> createProject() async {
    print(getProject().toJson());
    try{
      var response = await BaseRequests().post(
        'projects',
        data: getProject().toJson(),
        token:SharedPrefs().getString("token")
      );
      print(response.data);
      if(response.statusCode == 200){
        return true;
      }
      return false;
    }
    catch(e){
      print(e.toString());
      return false;
    }
  }

}