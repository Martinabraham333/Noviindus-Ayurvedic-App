import 'dart:developer';

import 'package:ayurvedic_centre_patients/core/app_strings.dart';
import 'package:http/http.dart' as http;

class ApiClient {
  final String baseUrl = 'https://flutter-amr.noviindus.in/api/';

  Future<http.Response> login(
    String endPoints,
    Map<String, dynamic> data,
  ) async {
    final url = Uri.parse(baseUrl + endPoints);
    log(url.toString());
    final response = await http.post(url, body: data);
    return response;
  }
Future<http.Response> post(
  String endPoint,
  Map<String, String> data) async {
  final url = Uri.parse(baseUrl + endPoint);
  log('POST → $url');
  log('BODY → $data');

  return await http.post(
    url,
    headers: {
      'Authorization': 'Bearer ${AppStrings.tocken}',
    },
    body: data, 
  ).timeout(const Duration(seconds: 20));
}


  Future<http.Response> get(String endPoints) async {
    final url = Uri.parse(baseUrl + endPoints);
    log(url.toString());
    final response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${AppStrings.tocken}',
      },
    );
    return response;
  }
}
