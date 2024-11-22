
import 'package:finailtask/API/models/projects/project_model.dart';

class ProfileModel {
  int? id;
  String? companyName;
  List<Projects>? projects;

  ProfileModel({this.id, this.companyName, this.projects});
  
  ProfileModel.fromJson(Map<String, dynamic> json) {
    print(json);
    id = json["results"]['id'];
    companyName = json["results"]['companyName'];
    if (json["results"]['projects'] != null) {
      projects = <Projects>[];
      json["results"]['projects'].forEach((v) {
        print(v);
        projects!.add(Projects.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['companyName'] = companyName;
    if (projects != null) {
      data['projects'] = projects!.map((v) => v.toJson()).toList();
    }
    return data;
  }

}