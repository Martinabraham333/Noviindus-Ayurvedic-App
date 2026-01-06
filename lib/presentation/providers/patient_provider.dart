
import 'package:ayurvedic_centre_patients/domain/entities/patient_entity.dart';
import 'package:ayurvedic_centre_patients/domain/usecases/patient_usecase.dart';
import 'package:flutter/material.dart';

class PatientProvider extends ChangeNotifier {
  final PatientUsecase patientUsecase;
  PatientProvider(this.patientUsecase);

  List<PatientEntity>? _patientData;
  List<PatientEntity>? get patientData=>_patientData;

  bool _isLoading=false;
  bool get isLoading=>_isLoading;

  String? _error;
  String? get error => _error;

  Future<void> fetchPatientList()async{
    print('patient provider called');
    _isLoading=true;
    _error=null;
    notifyListeners();
try {
  _patientData= await patientUsecase.execute();

 
} catch (e) {
   _error = e.toString();

}
_isLoading = false;
  notifyListeners();
  }

}