import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:govet_clinics_dashboard/Models/clinic_model.dart';

import '../constants.dart';

class Store {

  /// object from FirebaseFirestore
  FirebaseFirestore fireStore = FirebaseFirestore.instance;

  /// After Sign Up Update Clinic Information In Firebase Firestore
  addClinic(ClinicMode clinic) {
    fireStore.collection(Constants.clinicCollection).doc(clinic.clinicId).set({
      Constants.clinicId: clinic.clinicId,
      Constants.clinicName: clinic.clinicName,
      Constants.clinicType: clinic.clinicType,
      Constants.clinicAbout: clinic.clinicAbout,
      Constants.clinicPhone: clinic.clinicPhone,
      Constants.clinicPrice: clinic.clinicPrice,
      Constants.clinicRating: clinic.clinicRating,
      Constants.clinicLocation: clinic.clinicLocation,
      Constants.clinicExperience: clinic.clinicExperience,
    });
  }


}