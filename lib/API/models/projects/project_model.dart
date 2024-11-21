class Projects {
  final String? title , description , qualificationName , priceType ;
  final int? duration , budget;

  Projects({
    this.title,
    this.description,
    this.qualificationName,
    this.priceType,
    this.duration,
    this.budget,
  });

  factory Projects.fromJson(Map<String, dynamic> json) {
    return Projects(
      title: json['title'],
      description: json['description'],
      qualificationName: json['qualificationName'],
      priceType: json['priceType'],
      duration: json['duration'],
      budget: json['budget'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'qualificationName': qualificationName,
      'priceType': priceType,
      'duration': duration,
      'budget': budget,
    };
  }
}