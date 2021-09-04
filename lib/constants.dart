import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class Constants {

  ///firebase Collection Users
  static const String userCollection = 'Users';

  ///firebase Collection Clinics
  static const String clinicCollection = 'ClinicsCollection';

  /// Firebase Constants User
  static const String userName = 'UserName';
  static const String userPhone = 'UserPhone';
  static const String userId = 'UserId';
  static const String userAge = 'UserAge';
  static const String userImageUrl = 'UserImageUrl';

  /// Firebase Constants Clinic
  static const String clinicId = 'ClinicId';
  static const String clinicName = 'ClinicName';
  static const String clinicEmail = 'ClinicEmail';
  static const String clinicType = 'ClinicType';
  static const String clinicAbout = 'ClinicAbout';
  static const String clinicPhone = 'ClinicPhone';
  static const String clinicPrice = 'ClinicPrice';
  static const String clinicExperience = 'ClinicExperience';
  static const String clinicRating = 'ClinicRating';
  static const String clinicLocation = 'ClinicLocation';
  static const String clinicImageUrl = 'ClinicImageUrl';


  /// photo url
  static const String logInPhoto = 'images/log_in_photo.jpg';

  /// method navigate page
  static void navigatorPush({context, screen}) {
    Navigator.push(
      context,
      PageTransition(
        type: PageTransitionType.fade,
        child: screen,
      ),
    );
  }

}