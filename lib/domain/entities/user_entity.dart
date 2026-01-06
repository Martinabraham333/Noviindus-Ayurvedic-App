class UserEntity {
  final int id;
  final String? lastLogin;
  final String name;
  final String phone;
  final String address;
  final String mail;
  final String username;
  final String password;       // hashed password
  final String passwordText;   // plain password
  final int admin;
  final bool isAdmin;
  final bool isActive;
  final String createdAt;
  final String updatedAt;
  final String? branch;

  UserEntity({
    required this.id,
   required this.lastLogin,
    required this.name,
    required this.phone,
    required this.address,
    required this.mail,
    required this.username,
    required this.password,
    required this.passwordText,
    required this.admin,
    required this.isAdmin,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
   required this.branch,
  });
}
