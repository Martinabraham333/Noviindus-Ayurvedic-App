import 'package:ayurvedic_centre_patients/data/data_sources/patients_remote_data_source.dart';
import 'package:ayurvedic_centre_patients/data/models/patient_model.dart';
import 'package:ayurvedic_centre_patients/domain/entities/patient_entity.dart';

import 'package:ayurvedic_centre_patients/domain/repositories/patient_repository.dart';

class PatientRepositoryImpl implements PatientRepository {
  final PatientsRemoteDataSource remoteDataSource;
  PatientRepositoryImpl(this.remoteDataSource);
  @override
  Future<List<PatientEntity>> fetchPatientDeatils() async {
    try {
      List<PatientModel> patientModel = await remoteDataSource
          .fetchPatientsList();
      return patientModel;
    } catch (e) {
      throw Exception(e);
    }
  }
}
