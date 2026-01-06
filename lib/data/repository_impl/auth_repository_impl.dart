import 'package:ayurvedic_centre_patients/data/data_sources/auth_remote_data_source.dart';
import 'package:ayurvedic_centre_patients/data/models/user_model.dart';
import 'package:ayurvedic_centre_patients/domain/entities/user_entity.dart';
import 'package:ayurvedic_centre_patients/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl  implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  AuthRepositoryImpl(this.remoteDataSource);
  @override
  Future<UserEntity> login(String username, String password) async{
  try {
    UserModel userModel=await remoteDataSource.login(username, password);
    return userModel;
  } catch (e) {
    throw Exception('Login failed: ${e.toString()}');
  }
  }
   
}