import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:govet_clinics_dashboard/Screens/Clinic_Profile/clinic_profile_screen.dart';
import 'package:govet_clinics_dashboard/Screens/old_reservation/old_reservation_screen.dart';
import 'package:govet_clinics_dashboard/Screens/verify_reservation/verify_reservation_screen.dart';
import 'package:govet_clinics_dashboard/Widgets/custom_drawer/custom_drawer_header.dart';
import 'package:govet_clinics_dashboard/Widgets/custom_drawer/custom_drawer_item.dart';
import 'package:govet_clinics_dashboard/Widgets/custom_drawer/log_out_alert_dialog.dart';

import '../../constants.dart';
import '../loading_page.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key? key,
    required this.clinicId,
  });

  final clinicId;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection(Constants.clinicCollection).where(Constants.clinicId, isEqualTo: clinicId).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData){
            var clinicData = snapshot.data!.docs[0];
            return ListView(
              children: [
                CustomDrawerHeader(
                  clinicName: clinicData[Constants.clinicName],
                  clinicType: clinicData[Constants.clinicType],
                  clinicImageUrl: clinicData[Constants.clinicImageUrl],
                ),
                CustomDrawerItem(
                  icon: Icons.person,
                  itemTitle: 'Clinic Profile',
                  onTap: () {
                    Constants.navigatorPush(
                      context: context,
                      screen: ClinicProfileScreen(),
                    );
                  },
                ),
                CustomDrawerItem(
                  icon: Icons.mobile_friendly,
                  itemTitle: 'Verify Reservation',
                  onTap: () {
                    Constants.navigatorPush(
                      context: context,
                      screen: VerifyReservationScreen(),
                    );
                  },
                ),
                CustomDrawerItem(
                  icon: Icons.book,
                  itemTitle: 'Old Reservation',
                  onTap: () {
                    Constants.navigatorPush(
                      context: context,
                      screen: OldReservationScreen(),
                    );
                  },
                ),
                Divider(),
                CustomDrawerItem(
                  icon: Icons.logout,
                  itemTitle: 'Sign Out',
                  onTap: () {
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (BuildContext context) => LogOutAlertDialog(),
                    );
                  },
                ),
              ],
            );
          } else {
            return LoadingPage();
          }
        }
      ),
    );
  }
}
