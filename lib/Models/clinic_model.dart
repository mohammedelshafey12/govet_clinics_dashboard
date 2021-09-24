import 'package:cloud_firestore/cloud_firestore.dart';

class ClinicModel {
  final String? clinicId;
  final String? clinicName;
  final String? clinicEmail;
  final String? clinicPhone;
  final String? clinicServices;
  final String? clinicOldPrice;
  final String? clinicNewPrice;
  final String? clinicWorksHoursFrom;
  final String? clinicWorksHoursTo;
  final String? clinicAbout;
  final String? clinicRate;
  final GeoPoint? clinicLocation;
  final String? clinicImageUrl;
  final bool? clinicIsVerify;

  ClinicModel({
    required this.clinicId,
    required this.clinicName,
    required this.clinicEmail,
    required this.clinicPhone,
    required this.clinicServices,
    required this.clinicOldPrice,
    required this.clinicNewPrice,
    required this.clinicWorksHoursFrom,
    required this.clinicWorksHoursTo,
    required this.clinicAbout,
    required this.clinicRate,
    required this.clinicLocation,
    required this.clinicImageUrl,
    required this.clinicIsVerify,
  });
}
