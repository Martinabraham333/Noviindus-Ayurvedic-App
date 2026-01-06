import 'dart:convert';
import 'dart:developer';

import 'package:ayurvedic_centre_patients/core/api_client.dart';
import 'package:ayurvedic_centre_patients/core/app_strings.dart';
import 'package:ayurvedic_centre_patients/data/models/patient_model.dart';


class PatientsRemoteDataSource {
    final ApiClient client;
  PatientsRemoteDataSource(this.client);
    Future<List<PatientModel>> fetchPatientsList() async {
try {
      final response = await client.get('PatientList');
 
    
    if (response.statusCode == 200) {
      
      final jsonData = jsonDecode(response.body);
      
      if (jsonData["status"] == true) {
        
       
        List<PatientModel> patients=[];
        
        patients=(jsonData['patient'] as List).map((e)=> PatientModel.fromJson(e)).toList();
      
        return patients;
       
      } else {
        throw Exception(jsonData["message"]);
      }
    } else {
      throw Exception("Failed to fetch patient list: ${response.statusCode}");
    }
} catch (e) {

  throw Exception('Failed to fetch patient List');
}
  }

}