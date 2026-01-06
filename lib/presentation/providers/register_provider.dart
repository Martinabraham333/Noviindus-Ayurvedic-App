

import 'package:ayurvedic_centre_patients/domain/entities/patient_entity.dart';
import 'package:ayurvedic_centre_patients/domain/usecases/branch_usecase.dart';
import 'package:flutter/material.dart';

class RegisterProvider extends ChangeNotifier {
  final BranchUsecase branchUsecase;
  RegisterProvider(this.branchUsecase);

  List<BranchEntity>? _branchData;
  List<BranchEntity>? get branchData=>_branchData;

  List<String>? _branchDropDownList=[]; 
  List<String>? get branchDropDownList=> _branchDropDownList; 

  bool _isLoading=false;
  bool get isLoading=>_isLoading;

  String? _error;
  String? get error => _error;

  Future<void> fetchbranchList()async{
    print("inside fetchbranchList");
    _isLoading=true;
    _error=null;
    notifyListeners();
try {
  _branchData= await branchUsecase.execute();
  for (var element in _branchData!) {
    _branchDropDownList!.add(element.name);
  }
  print("_branchData $_branchData");

} catch (e) {
   _error = e.toString();
 
}
_isLoading = false;
  notifyListeners();
  }

}