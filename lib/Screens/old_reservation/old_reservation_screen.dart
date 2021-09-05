import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../../constants.dart';

class OldReservationScreen extends StatefulWidget {
  const OldReservationScreen({Key? key}) : super(key: key);

  @override
  State<OldReservationScreen> createState() => _OldReservationScreenState();
}

class _OldReservationScreenState extends State<OldReservationScreen> {
  String uid = "";

  void initState() {
    // TODO: implement initState
    super.initState();
    SchedulerBinding.instance!.addPostFrameCallback((_) {
      User? userAuth = FirebaseAuth.instance.currentUser;
      setState(() {
        uid = userAuth!.uid;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Old Reservation',
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection(Constants.clinicReservationCollection)
            .where(
          Constants.clinicReservationVerify,
          isEqualTo: false,
        )
            .where(
          Constants.clinicId,
          isEqualTo: uid,
        )
            .snapshots(),
        builder: (context, snapshot) {
          return ListView.builder(
            padding: const EdgeInsets.all(20.0),
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              var clinicReservationData = snapshot.data!.docs[index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(10.0),
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.white,
                      child: clinicReservationData[Constants.userImageUrl] ==
                          null
                          ? Image.asset(
                        Constants.person,
                        fit: BoxFit.cover,
                      )
                          : ClipRRect(
                        borderRadius: BorderRadius.circular(30.0),
                        child: Image.network(
                          clinicReservationData[Constants.clinicImageUrl],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    title: Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: width * 0.05,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Name: ${clinicReservationData[Constants.userName]}',
                                    style: TextStyle(
                                      fontFamily: 'custom_font',
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                      color: Constants.primary_blue_color,
                                    ),
                                  ),
                                  SizedBox(
                                    height: height * 0.01,
                                  ),
                                  Text(
                                    'Date: ${clinicReservationData[Constants.clinicReservationDate]}',
                                    style: TextStyle(
                                      fontFamily: 'custom_font',
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                      color: Constants.primary_blue_color,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: width * 0.02,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Email: ${clinicReservationData[Constants.userEmail]}',
                                    style: TextStyle(
                                      fontFamily: 'custom_font',
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  SizedBox(
                                    height: height * 0.01,
                                  ),
                                  Text(
                                    'Phone: ${clinicReservationData[Constants.userPhone]}',
                                    style: TextStyle(
                                      fontFamily: 'custom_font',
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: height * 0.05,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: width * 0.05,
                            ),
                            Expanded(
                              child: RaisedButton(
                                color: Colors.green,
                                child: Center(
                                  child: Text(
                                    "Accept Request",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'custom_font',
                                    ),
                                  ),
                                ),
                                onPressed: () {},
                              ),
                            ),
                            SizedBox(
                              width: width * 0.02,
                            ),
                            Expanded(
                              child: RaisedButton(
                                color: Colors.red,
                                child: Center(
                                  child: Text(
                                    "Cancel Request",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'custom_font',
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  // Navigator.pop(context);
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
