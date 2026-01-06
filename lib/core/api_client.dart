import 'dart:developer';

import 'package:ayurvedic_centre_patients/core/app_strings.dart';
import 'package:http/http.dart' as http;

class ApiClient {
  final String baseUrl = 'https://flutter-amr.noviindus.in/api/';

  Future<http.Response> post(
    String endPoints,
    Map<String, dynamic> data,
  ) async {
    final url = Uri.parse(baseUrl + endPoints);
    log(url.toString());
    final response = await http.post(url, body: data);
    return response;
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
