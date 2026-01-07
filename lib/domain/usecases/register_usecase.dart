
import 'package:ayurvedic_centre_patients/domain/entities/treatment_entity.dart';
import 'package:ayurvedic_centre_patients/domain/repositories/register_repository.dart';

class RegisterUsecase {
  final RegisterRepository repository;
  RegisterUsecase(this.repository);
    Future<bool> execute(Map<String,String> data)async{
  return await repository.postRegisterDeatils(data);
  }
}