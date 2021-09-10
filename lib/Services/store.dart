import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:govet_clinics_dashboard/Models/clinic_model.dart';

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
      Constants.clinicIsVerify: clinic.clinicIsVerify,
    });
  }

  verifyClinicReservation(context, docId) {
    showDialog(
      context: context,
      builder: (context) {
        return Container(
          child: Dialog(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Loading ...'),
                  CircularProgressIndicator(),
                ],
              ),
            ),
          ),
        );
      },
    );
    fireStore.collection(Constants.clinicReservationCollection).doc(docId).update({
      Constants.clinicReservationVerify: true,
    }).whenComplete(() {
      Navigator.of(context).pop();
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Clinic Reservation added successfully",
            style: TextStyle(
              fontFamily: 'custom_Font',
            ),
          ),
        ),
      );
    });
  }
}
