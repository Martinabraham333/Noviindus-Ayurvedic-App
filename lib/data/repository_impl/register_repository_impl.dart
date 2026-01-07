import 'package:ayurvedic_centre_patients/data/data_sources/patients_remote_data_source.dart';
import 'package:ayurvedic_centre_patients/data/data_sources/register_remote_data_source.dart';
import 'package:ayurvedic_centre_patients/data/models/patient_model.dart';
import 'package:ayurvedic_centre_patients/data/models/treatment_model.dart';
import 'package:ayurvedic_centre_patients/domain/entities/patient_entity.dart';
import 'package:ayurvedic_centre_patients/domain/entities/treatment_entity.dart';

import 'package:ayurvedic_centre_patients/domain/repositories/register_repository.dart';

class RegisterRepositoryImpl implements RegisterRepository {
  final RegisterRemoteDataSource remoteDataSource;
  RegisterRepositoryImpl(this.remoteDataSource);
  @override
  Future<List<BranchEntity>> fetchBranchDeatils() async {
    try {
      List<BranchModel> branchModel = await remoteDataSource.fetchBranchList();
      return branchModel;
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<List<TreatmentEntity>> fetchTreatmentDeatils()async {
    try {
      List<TreatmentModel> treatmentModel = await remoteDataSource.fetchTreatmentList();
      return treatmentModel;
    } catch (e) {
       print(e);
      throw Exception(e);
    }
  }
  @override
  Future<bool> postRegisterDeatils(Map<String,String> data)async {
    try {
      bool result = await remoteDataSource.postRegisterDetails(data);
      return result;
    } catch (e) {
       print(e);
      throw Exception(e);
    }
  }
}
