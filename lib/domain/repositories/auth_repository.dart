import 'package:ayurvedic_centre_patients/domain/entities/user_entity.dart';

abstract  class AuthRepository {
  Future<UserEntity> login(String username, String password);
}