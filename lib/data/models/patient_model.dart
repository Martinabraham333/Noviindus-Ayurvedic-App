import 'dart:developer';

import 'package:ayurvedic_centre_patients/domain/entities/patient_entity.dart';

class PatientModel extends PatientEntity {
  PatientModel({
    required super.id,
    required super.patientEntityDetailsSet,
    required super.branches,
    required super.user,
    required super.payment,
    required super.name,
    required super.phone,
    required super.address,
    required super.price,
    required super.totalAmount,
    required super.discountAmount,
    required super.advanceAmount,
    required super.balanceAmount,
    required super.dateNdTime,
    required super.isActive,
    required super.createdAt,
    required super.updatedAt,
  });

  factory PatientModel.fromJson(Map<String, dynamic> json) {

    return PatientModel(
      id: json['id'],
      patientEntityDetailsSet: (json['patientdetails_set'] as List)
          .map((e) => PatientDeatilsModel.fromJson(e))
          .toList(),
      branches: ([json['branch']??Map<String,dynamic>()]).map((e)=> BranchModel.fromJson(e)).toList(), 
      user: json['user'].toString(),
      payment: json['payment'].toString(),
      name: json['name'].toString(),
      phone: json['phone'].toString(),
      address: json['address'].toString(),
      price: double.tryParse(json['price']?.toString() ?? '0') ?? 0,
      totalAmount: double.tryParse(json['total_amount'].toString()) ?? 0,
      discountAmount: double.tryParse(json['discount_amount'].toString()) ?? 0,
      advanceAmount: double.tryParse(json['advance_amount'].toString()) ?? 0,
      balanceAmount: double.tryParse(json['balance_amount'].toString()) ?? 0,
      dateNdTime: json['date_nd_time'] != null
          ? DateTime.parse(json['date_nd_time'])
          : DateTime.now(),
      isActive: json['is_active'] ?? true,
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}

class PatientDeatilsModel extends PatientDetailsEntity {
  PatientDeatilsModel({
    required super.id,
    required super.male,
    required super.female,
    required super.patientEntityId,
    required super.treatment,
    required super.treatmentName,
  });

  factory PatientDeatilsModel.fromJson(Map<String, dynamic> json) {
     return PatientDeatilsModel(
      id: json['id'],
      male: json['male'].toString(),
      female: json['female'].toString(),
      patientEntityId: json['patient'],
      treatment: json['treatment'] != null ? json['treatment'] : 0,
      treatmentName: json['treatment_name'] != null
          ? json['treatment_name'].toString()
          : '',
    );
  }
}

class BranchModel extends BranchEntity {
  BranchModel({
    required super.id,
    required super.name,
    required super.patientEntitysCount,
    required super.location,
    required super.phone,
    required super.mail,
    required super.address,
    required super.gst,
    required super.isActive,
  });

  factory BranchModel.fromJson(Map<String, dynamic> json) {
   
    return BranchModel(
      id:json['id']==null?0:json['id'],
      name: json['name'].toString(),
      patientEntitysCount:json['patients_count']==null?0:json['patients_count'],
      location: json['location'].toString(),
      phone: json['phone']==null?'':json['phone'],
      mail: json['mail'].toString(),
      address: json['address'].toString(),
      gst: json['gst']==null?'':json['gst'],
      isActive: json['is_active'] ?? true,
    );
  }
}
