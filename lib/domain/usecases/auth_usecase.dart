import 'package:ayurvedic_centre_patients/domain/entities/user_entity.dart';
import 'package:ayurvedic_centre_patients/domain/repositories/auth_repository.dart';

class AuthUsecase {
  final AuthRepository repository;
  AuthUsecase(this.repository);
  Future <UserEntity> execute(String username, String password)async{
  return await repository.login(username, password);
  }
}