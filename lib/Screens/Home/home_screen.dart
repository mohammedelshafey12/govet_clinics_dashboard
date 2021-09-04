import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:govet_clinics_dashboard/Widgets/custom_drawer/custom_drawer.dart';

import '../../constants.dart';
import 'home_screen_body.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String uid = "";

  void initState() {
    // TODO: implement initState
    super.initState();
    SchedulerBinding.instance?.addPostFrameCallback((_) {
      User? userAuth = FirebaseAuth.instance.currentUser;
      setState(() {
        uid = userAuth!.uid;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'GoVet Dashboard',
        ),
      ),
      body: HomeScreenBody(),
      drawer: CustomDrawer(
        clinicId: uid,
      ),
    );
  }
}
