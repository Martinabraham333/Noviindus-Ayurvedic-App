class PatientEntity {
  final int id;
  final List<PatientDetailsEntity> patientEntityDetailsSet;
  final List<BranchEntity> branches; 
  final String user;
  final String payment;
  final String name;
  final String phone;
  final String address;
  final double? price;
  final double totalAmount;
  final double discountAmount;
  final double advanceAmount;
  final double balanceAmount;
  final DateTime? dateNdTime;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;

  PatientEntity({
    required this.id,
    required this.patientEntityDetailsSet,
    required this.branches,
    required this.user,
    required this.payment,
    required this.name,
    required this.phone,
    required this.address,
  required  this.price,
    required this.totalAmount,
    required this.discountAmount,
    required this.advanceAmount,
    required this.balanceAmount,
   required this.dateNdTime,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });
}

class PatientDetailsEntity {
  final int id;
  final String male;
  final String female;
  final int patientEntityId;
  final int? treatment;
  final String? treatmentName;

  PatientDetailsEntity({
    required this.id,
    required this.male,
    required this.female,
    required this.patientEntityId,
   required this.treatment,
   required this.treatmentName,
  });
}

class BranchEntity {
  final int id;
  final String name;
  final int patientEntitysCount;
  final String location;
  final String phone;
  final String mail;
  final String address;
  final String gst;
  final bool isActive;

  BranchEntity({
    required this.id,
    required this.name,
    required this.patientEntitysCount,
    required this.location,
    required this.phone,
    required this.mail,
    required this.address,
    required this.gst,
    required this.isActive,
  });
}
