

import 'package:ayurvedic_centre_patients/domain/entities/patient_entity.dart';
import 'package:ayurvedic_centre_patients/domain/repositories/register_repository.dart';

class BranchUsecase {
  final RegisterRepository repository;
  BranchUsecase(this.repository);
    Future<List<BranchEntity>> execute()async{
  return await repository.fetchBranchDeatils();
  }
}