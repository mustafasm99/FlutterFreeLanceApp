class PostUser {
  final int? id;
  final int? duration;
  final String? description;
  final String? qualifications;
  final String? priceType;
  final double? budget;
  final String? clientName;
  final int? clientId;
  final bool? isLiked;
  final int? likes;
  final String? name;
  final String? imageUrl;
  final String? date;
  final String? status;
  PostUser({
     this.name,
     this.imageUrl,
     this.date,
     this.status,
     this.id,
     this.duration,
     this.description,
     this.qualifications,
     this.priceType,
     this.budget,
     this.clientName,
     this.clientId,
     this.isLiked,
     this.likes,
  });

  factory PostUser.fromJson(Map<String, dynamic> json) {
    return PostUser(
      name: json['title'],
      imageUrl: json['imageUrl'],
      date: json['creationTime'],
      status: json['status'],
      id: json['id'],
      duration: json['duration'],
      description: json['description'],
      qualifications: json['qualifications'],
      priceType: json['priceType'],
      budget: json['budget'],
      clientName: json['clientName'],
      clientId: json['clientId'],
      isLiked: json['isLiked'],
      likes: json['likes'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'imageUrl': imageUrl,
    };
  }
}
