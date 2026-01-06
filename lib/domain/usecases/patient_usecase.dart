import 'package:ayurvedic_centre_patients/domain/entities/patient_entity.dart';
import 'package:ayurvedic_centre_patients/domain/repositories/patient_repository.dart';

class PatientUsecase {
  final PatientRepository repository;
  PatientUsecase(this.repository);
    Future<List<PatientEntity>> execute()async{
  return await repository.fetchPatientDeatils();
  }
}