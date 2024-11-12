class PostUser {
  final String name;
  final String? imageUrl;
  final String date;
  final int status;
  PostUser({required this.name, this.imageUrl ,required this.date , required this.status});

  factory PostUser.fromJson(Map<String, dynamic> json) {
    return PostUser(
      name: json['name'],
      imageUrl: json['imageUrl'],
      date: json['date'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'imageUrl': imageUrl,
    };
  }

  

}