class Users{
  final String? id;
  final String? name;
  final String? email;
  final String? password;
  final String? phone;
  final String? address;
  final String? role;
  final String? status;
  final String? createdAt;
  final String? updatedAt;
  final String? imageUrl;
  final String? userType;
  final String? workTitle;
  final String? accessToken;

  Users({
    this.id,
    this.name,
    this.email,
    this.password,
    this.phone,
    this.address,
    this.role,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.imageUrl,
    this.userType,
    this.workTitle,
    this.accessToken,
  });

  factory Users.fromJson(Map<String, dynamic> json){
    print(json['results']['userDetailsDTO']);
    return Users(
      id: json['results']?['userDetailsDTO']?['id'] != null ? json['results']['userDetailsDTO']['id'].toString() : '',
      name: json['results']?['userDetailsDTO']?['name'] ?? '',
      email: json['results']?['userDetailsDTO']?['username'] ?? '',
      password: json['password'] ?? '',
      phone: json['results']?['userDetailsDTO']?['phoneNumber'] ?? '',
      address: json['address'] ?? '',
      role: json['results']?['userDetailsDTO']?['role'] ?? '',
      status: json['status'] ?? '',
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      userType: json['results']?['userDetailsDTO']?['role'] ?? '',
      accessToken: json['results']?['accessToken'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'email': email,
    'password': password,
    'phone': phone,
    'address': address,
    'role': role,
    'status': status,
    'created_at': createdAt,
    'updated_at': updatedAt,
    'imageUrl': imageUrl,
    'userType': userType,
    'accessToken': accessToken,
  };
}