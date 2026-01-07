
import 'package:ayurvedic_centre_patients/domain/entities/treatment_entity.dart';
import 'package:ayurvedic_centre_patients/domain/repositories/register_repository.dart';

class TreatementUsecase {
  final RegisterRepository repository;
  TreatementUsecase(this.repository);
    Future<List<TreatmentEntity>> execute()async{
  return await repository.fetchTreatmentDeatils();
  }
}