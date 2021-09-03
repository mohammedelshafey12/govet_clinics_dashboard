import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:govet_clinics_dashboard/Models/clinic_model.dart';
import 'package:govet_clinics_dashboard/Screens/Home/home_screen.dart';

import '../constants.dart';

class Store {
  /// object from FirebaseFirestore
  FirebaseFirestore fireStore = FirebaseFirestore.instance;

  /// After Sign Up Update Clinic Information In Firebase Firestore
  addClinic(ClinicModel clinic) {
    fireStore.collection(Constants.clinicCollection).doc(clinic.clinicId).set({
      Constants.clinicId: clinic.clinicId,
      Constants.clinicName: clinic.clinicName,
      Constants.clinicEmail: clinic.clinicEmail,
      Constants.clinicType: clinic.clinicType,
      Constants.clinicAbout: clinic.clinicAbout,
      Constants.clinicPhone: clinic.clinicPhone,
      Constants.clinicPrice: clinic.clinicPrice,
      Constants.clinicLocation: clinic.clinicLocation,
      Constants.clinicExperience: clinic.clinicExperience,
      Constants.clinicImageUrl: clinic.clinicImageUrl,
    });
  }
}
