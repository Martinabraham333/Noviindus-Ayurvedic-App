
import 'package:ayurvedic_centre_patients/domain/entities/patient_entity.dart';
import 'package:ayurvedic_centre_patients/domain/usecases/patient_usecase.dart';
import 'package:flutter/material.dart';


class PatientProvider extends ChangeNotifier {
  final PatientUsecase patientUsecase;
  PatientProvider(this.patientUsecase);

  List<PatientEntity>? _patientData;
  List<PatientEntity>? get patientData=>_patientData;
  List<PatientEntity>? _filterPatientData;
  List<PatientEntity>? get filterPatientData=>_filterPatientData;

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

 _filterPatientData=_patientData;
} catch (e) {
   _error = e.toString();

}
_isLoading = false;
  notifyListeners();
  }

  filterPatientDataFunction(String querry){
    _filterPatientData=_patientData!.where((item){
   final  filtered =item.name.toLowerCase().contains(querry.toLowerCase());
   return filtered;
    }).toList();
    notifyListeners();
  }

}