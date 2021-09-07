import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class Constants {

  /// firebase Collections
  static const String userCollection = 'Users';
  static const String petCollection = 'PetsCollection';
  static const String homeVisitCollection = 'HomeVisitCollection';
  static const String clinicCollection = 'ClinicsCollection';
  static const String clinicReservationCollection = 'ClinicReservationCollection';

  /// Firebase Constants users
  static const String userName = 'UserName';
  static const String userPhone = 'UserPhone';
  static const String userEmail = 'UserEmail';
  static const String userId = 'UserId';
  static const String userAge = 'UserAge';
  static const String userImageUrl = 'UserImageUrl';
  /// Firebase Constants home visit
  static const String homeVisitDate = 'HomeVisitDate';
  static const String homeVisitAddress = 'HomeVisitAddress';
  static const String homeVisitReason = 'HomeVisitReason';
  static const String homeVisitDoctorId = 'HomeVisitDoctorId';
  static const String homeVisitDoctorName = 'HomeVisitDoctorName';
  static const String homeVisitDoctorPhone = 'HomeVisitDoctorPhone';

  /// Firebase Constants pet
  static const String petId = 'PetId';
  static const String petName = 'PetName';
  static const String petBreed = 'PetBreed';
  static const String petGender = 'PetGender';
  static const String petUrlImage = 'PetUrlImage';
  static const String petAge = 'PetAge';
  static const String petWeight = 'PetWeight';
  static const String petHeight = 'PetHeight';
  static const String petAdditionalNote = 'PetAdditionalNote';

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
  static const String clinicIsVerify = 'ClinicIsVerify';

  /// Firebase Constants Clinic Reservation
  static const String clinicReservationDate = 'ClinicReservationDate';
  static const String clinicReservationVerify = 'ClinicReservationVerify';

  /// constants app colors
  static const Color primary_blue_color = Color(0xfff25265E);
  static const Color primary_yellow_color = Color(0xfffF79B23);
  static const Color home_background_color = Color(0xfffF6F8FC);

  /// photo url
  static const String logInPhoto = 'images/log_in_photo.jpg';
  static const String person = 'images/person.png';

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

  static void navigatorPushAndRemove({context, screen}) {
    Navigator.pushAndRemoveUntil(
      context,
      PageTransition(
        type: PageTransitionType.fade,
        child: screen,
      ),
          (route) => false,
    );
  }

}