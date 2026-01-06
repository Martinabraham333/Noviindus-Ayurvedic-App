import 'dart:convert';
import 'dart:developer';

import 'package:ayurvedic_centre_patients/core/api_client.dart';
import 'package:ayurvedic_centre_patients/data/models/patient_model.dart';

class RegisterRemoteDataSource {
  final ApiClient client;
  RegisterRemoteDataSource(this.client);
  Future<List<BranchModel>> fetchBranchList() async {
    try {
      final response = await client.get('BranchList');
      log('BranchList List');
      log(response.statusCode.toString());

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);

        if (jsonData["status"] == true) {
          List<BranchModel> barnches = [];

          barnches = (jsonData['branches'] as List)
              .map((e) => BranchModel.fromJson(e))
              .toList();

          return barnches;
        } else {
          throw Exception(jsonData["message"]);
        }
      } else {
        throw Exception("Failed to fetch barnche list: ${response.statusCode}");
      }
    } catch (e) {
      log(e.toString());
      throw Exception('Failed to fetch barnche List');
    }
  }
}
