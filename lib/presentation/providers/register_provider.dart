import 'package:ayurvedic_centre_patients/domain/entities/patient_entity.dart';
import 'package:ayurvedic_centre_patients/domain/entities/treatment_entity.dart';
import 'package:ayurvedic_centre_patients/domain/usecases/branch_usecase.dart';
import 'package:ayurvedic_centre_patients/domain/usecases/treatement_usecase.dart';
import 'package:flutter/material.dart';

class RegisterProvider extends ChangeNotifier {
  final BranchUsecase branchUsecase;
  final TreatementUsecase treatmentUsecase;
  RegisterProvider(this.branchUsecase, this.treatmentUsecase);

  List<BranchEntity>? _branchData;
  List<BranchEntity>? get branchData => _branchData;

  List<Map<String, dynamic>>? _branchDropDownList = [];
  List<Map<String, dynamic>>? get branchDropDownList => _branchDropDownList;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _error;
  String? get error => _error;

  Future<void> fetchbranchList() async {
    print("inside fetchbranchList");
    _isLoading = true;
    _error = null;
    notifyListeners();
    try {
      _branchData = await branchUsecase.execute();
      for (var element in _branchData!) {
        _branchDropDownList!.add({'val1': element.id, 'val2': element.name});
      }
      print("_branchData $_branchData");
    } catch (e) {
      _error = e.toString();
    }
    _isLoading = false;
    notifyListeners();
  }

  List<TreatmentEntity>? _treatmentData;
  List<TreatmentEntity>? get treatmentData => _treatmentData;

  List<Map<String, dynamic>> _treatmenDropDownList = [];
  List<Map<String, dynamic>> get treatmenDropDownList => _treatmenDropDownList;

  Future<void> fetchTreatmentList() async {
    print("inside fetchTreatmentList");
    _isLoading = true;
    _error = null;
    notifyListeners();
    try {
      _treatmentData = await treatmentUsecase.execute();
      for (var element in _treatmentData!) {
        _treatmenDropDownList.add({'val1': element.id, 'val2': element.name});
      }
      print("_treatmentData $_treatmentData");
    } catch (e) {
      print(e);
      _error = e.toString();
    }
    _isLoading = false;
    notifyListeners();
  }

  int _maleNumber = 0;
  int get maleNumber => _maleNumber;

  maleIncrement() {
    _maleNumber = _maleNumber + 1;
    notifyListeners();
  }

  maleDecrement() {
    _maleNumber = _maleNumber - 1;
    notifyListeners();
  }

  int _femaleNumber = 0;
  int get femaleNumber => _femaleNumber;

  femaleIncrement() {
    _femaleNumber = _femaleNumber + 1;
    notifyListeners();
  }

  femaleDecrement() {
    _femaleNumber = _femaleNumber - 1;
    notifyListeners();
  }

clickEditIcon(int maleCount,int femaleCount){
_maleNumber=maleCount;
_femaleNumber=femaleCount;
 notifyListeners();
}

  clearGenderNumber() {
    _maleNumber = 0;
    _femaleNumber = 0;
    notifyListeners();
  }

  List<Map<String, dynamic>> _treatmentList = [];
  List<Map<String, dynamic>> get treatmentList => _treatmentList;
  addTreatments({
    required int treatmentId,
    required String treatmentName,
    required int maleCount,
    required int femaleCount,
  }) {
    List maleList = [];
    List femaleList = [];

    for (var i = 0; i < maleCount; i++) {
      maleList.add(treatmentId);
    }
    for (var i = 0; i < femaleCount; i++) {
      femaleList.add(treatmentId);
    }

    print('malelist : ${maleList.join(',')}');

    _treatmentList.add({
      'id': treatmentId,
      'name': treatmentName,
      'maleCount': maleCount,
      'femaleCount': femaleCount,
      'male': maleList.join(','),
      'female': femaleList.join(','),
    });
    notifyListeners();
  }
  updateTreatments({
    required int index,
    required int treatmentId,
    required String treatmentName,
    required int maleCount,
    required int femaleCount,
  }) {
    List maleList = [];
    List femaleList = [];

    for (var i = 0; i < maleCount; i++) {
      maleList.add(treatmentId);
    }
    for (var i = 0; i < femaleCount; i++) {
      femaleList.add(treatmentId);
    }

    print('malelist : ${maleList.join(',')}');
_treatmentList[index]={
      'id': treatmentId,
      'name': treatmentName,
      'maleCount': maleCount,
      'femaleCount': femaleCount,
      'male': maleList.join(','),
      'female': femaleList.join(','),
    };
   
    notifyListeners();
  }

  removeTreatment(int index){
    _treatmentList.removeAt(index);
    notifyListeners();
  }
}
