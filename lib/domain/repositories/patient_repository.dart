import 'package:ayurvedic_centre_patients/domain/entities/patient_entity.dart';
import 'package:ayurvedic_centre_patients/domain/entities/user_entity.dart';

abstract  class PatientRepository {
    Future<List<PatientEntity>>  fetchPatientDeatils();
}