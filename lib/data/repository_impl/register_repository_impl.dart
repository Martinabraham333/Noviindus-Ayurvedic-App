import 'package:ayurvedic_centre_patients/data/data_sources/patients_remote_data_source.dart';
import 'package:ayurvedic_centre_patients/data/data_sources/register_remote_data_source.dart';
import 'package:ayurvedic_centre_patients/data/models/patient_model.dart';
import 'package:ayurvedic_centre_patients/domain/entities/patient_entity.dart';

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
}
