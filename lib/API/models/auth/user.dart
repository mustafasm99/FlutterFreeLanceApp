class Users{
  final String id;
  final String name;
  final String email;
  final String password;
  final String phone;
  final String address;
  final String role;
  final String status;
  final String createdAt;
  final String updatedAt;

  Users({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.phone,
    required this.address,
    required this.role,
    required this.status,
    required this.createdAt,
    required this.updatedAt
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
      updatedAt: json['updated_at']
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
    'updated_at': updatedAt
  };
}