import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:govet_clinics_dashboard/Screens/Clinic_Profile/clinic_profile_screen.dart';
import 'package:govet_clinics_dashboard/Screens/old_reservation/old_reservation_screen.dart';
import 'package:govet_clinics_dashboard/Screens/verify_reservation/verify_reservation_screen.dart';
import 'package:govet_clinics_dashboard/Widgets/custom_drawer/custom_drawer_header.dart';
import 'package:govet_clinics_dashboard/Widgets/custom_drawer/custom_drawer_item.dart';
import 'package:govet_clinics_dashboard/Widgets/custom_drawer/log_out_alert_dialog.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          CustomDrawerHeader(
            clinicName: 'San Clinic',
            clinicType: 'Animale Clinic',
          ),
          CustomDrawerItem(
            icon: Icons.person,
            itemTitle: 'Clinic Profile',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ClinicProfileScreen(),
                ),
              );
            },
          ),
          CustomDrawerItem(
            icon: Icons.mobile_friendly,
            itemTitle: 'Verify Reservation',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => VerifyReservationScreen(),
                  ),
              );
            },
          ),
          CustomDrawerItem(
            icon: Icons.book,
            itemTitle: 'Old Reservation',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => OldReservationScreen(),
                ),
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
      ),
    );
  }
}
