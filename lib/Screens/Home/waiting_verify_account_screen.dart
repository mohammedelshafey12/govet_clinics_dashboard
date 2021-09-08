import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:govet_clinics_dashboard/Screens/Home/splash_screen.dart';
import 'package:progress_indicators/progress_indicators.dart';

import '../../constants.dart';
import 'home_screen.dart';

class WaitingVerifyAccountScreen extends StatefulWidget {
  const WaitingVerifyAccountScreen({Key? key}) : super(key: key);

  @override
  State<WaitingVerifyAccountScreen> createState() => _WaitingVerifyAccountScreenState();
}

class _WaitingVerifyAccountScreenState extends State<WaitingVerifyAccountScreen> {
  String uid = '';

  void initState() {
    // TODO: implement initState
    super.initState();
    User? userAuth = FirebaseAuth.instance.currentUser;
    setState(() {
      uid = userAuth!.uid;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection(Constants.clinicCollection)
              .where(Constants.clinicId, isEqualTo: uid)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var doctorData = snapshot.data!.docs[0];
              if (doctorData[Constants.clinicIsVerify]) {
                return HomeScreen();
              } else {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        FadingText(
                          'Soon...',
                          style: TextStyle(
                            fontFamily: 'custom_font_bold',
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Constants.primary_yellow_color,

                          ),
                        ),
                        FadingText(
                          'We will verify your account soon',
                          style: TextStyle(
                            fontFamily: 'custom_font_bold',
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Constants.primary_yellow_color,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
            } else {
              return SplashScreen();
            }
          }),
    );
  }
}
