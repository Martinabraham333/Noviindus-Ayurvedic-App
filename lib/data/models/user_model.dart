import 'package:ayurvedic_centre_patients/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.id,
    required super.name,
    required super.phone,
    required super.address,
    required super.mail,
    required super.username,
    required super.password,
    required super.passwordText,
    required super.admin,
    required super.isAdmin,
    required super.isActive,
    required super.createdAt,
    required super.updatedAt,
    required super.lastLogin,
    required super.branch,
  });
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      lastLogin: json['last_login'],
      name: json['name'],
      phone: json['phone'],
      address: json['address'],
      mail: json['mail'],
      username: json['username'],
      password: json['password'],
      passwordText: json['password_text'],
      admin: json['admin'],
      isAdmin: json['is_admin'],
      isActive: json['is_active'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      branch: json['branch']?.toString(),
    );
  }
}
