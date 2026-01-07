import 'package:ayurvedic_centre_patients/domain/entities/treatment_entity.dart';

class TreatmentModel extends TreatmentEntity {
  TreatmentModel({required super.id,required super.name});
  factory TreatmentModel.fromJson(Map<String,dynamic> json){
return TreatmentModel(id: json['id'], name: json['name']);
  }
}