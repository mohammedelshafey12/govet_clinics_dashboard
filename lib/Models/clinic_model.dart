import 'package:cloud_firestore/cloud_firestore.dart';

class ClinicModel {
  final String? clinicId;
  final String? clinicName;
  final String? clinicEmail;
  final String? clinicPhone;
  final String? clinicType;
  final String? clinicPrice;
  final String? clinicAbout;
  final String? clinicExperience;
  final GeoPoint? clinicLocation;
  final String? clinicImageUrl;

  ClinicModel({
    required this.clinicId,
    required this.clinicName,
    required this.clinicEmail,
    required this.clinicPhone,
    required this.clinicType,
    required this.clinicPrice,
    required this.clinicAbout,
    required this.clinicExperience,
    required this.clinicLocation,
    required this.clinicImageUrl,
  });
}
