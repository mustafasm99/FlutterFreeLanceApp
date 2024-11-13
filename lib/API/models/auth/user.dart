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
    this.userType
  });

  factory Users.fromJson(Map<String, dynamic> json){
    return Users(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      password: json['password'],
      phone: json['phone'],
      address: json['address'],
      role: json['role'],
      status: json['status'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      imageUrl: json['imageUrl'],
      userType: json['userType'],
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
  };
}