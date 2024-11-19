class Projects {
  final String title , description , qualificationName , priceType ;
  final double duration , budget;

  Projects({
    required this.title,
    required this.description,
    required this.qualificationName,
    required this.priceType,
    required this.duration,
    required this.budget,
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