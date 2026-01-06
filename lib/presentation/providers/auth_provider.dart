import 'package:ayurvedic_centre_patients/domain/entities/user_entity.dart';
import 'package:ayurvedic_centre_patients/domain/usecases/auth_usecase.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  final AuthUsecase authUsecase;
  AuthProvider(this.authUsecase);

  UserEntity? _userDetails;
  UserEntity? get userDeatils=>_userDetails;

  bool _isLoading=false;
  bool get isLoading=>_isLoading;

  String? _error;
  String? get error => _error;

  Future<void> login(String username, String password)async{
    _isLoading=true;
    _error=null;
    notifyListeners();
try {
  _userDetails= await authUsecase.execute(username, password);
} catch (e) {
   _error = e.toString();
}
_isLoading = false;
  notifyListeners();
  }

}