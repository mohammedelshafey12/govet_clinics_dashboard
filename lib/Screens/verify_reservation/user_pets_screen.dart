import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/scheduler.dart';
import 'package:govet_clinics_dashboard/Widgets/loading_page.dart';
import 'package:govet_clinics_dashboard/Widgets/resercation_user_data_card_item.dart';

import '../../constants.dart';

class UserPetsScreen extends StatelessWidget {
  const UserPetsScreen({
    Key? key,
    required this.clinicReservationData,
  });

  final clinicReservationData;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text('User Profile'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              'User Information',
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5,
              ),
            ),
            SizedBox(
              height: height * 0.05,
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Card(
                    child: Container(
                      height: height * 0.4,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(
                          clinicReservationData[Constants.userImageUrl],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      ReservationUserDataCardItem(
                        title: 'Name',
                        subTitle: clinicReservationData[Constants.userName],
                      ),
                      ReservationUserDataCardItem(
                        title: 'Phone',
                        subTitle: clinicReservationData[Constants.userPhone],
                      ),
                      ReservationUserDataCardItem(
                        title: 'Email',
                        subTitle: clinicReservationData[Constants.userEmail],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: height * 0.05,
            ),
            Text(
              'User Pets',
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5,
              ),
            ),
            SizedBox(
              height: height * 0.05,
            ),
            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection(Constants.petCollection)
                  .where(Constants.userId,
                      isEqualTo: clinicReservationData[Constants.userId])
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      var petData = snapshot.data!.docs[index];
                      return Card(
                        margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
                        child: ListTile(
                          contentPadding: const EdgeInsets.all(20.0),
                          leading: Container(
                            width: height * 0.1,
                            height: height * 0.1,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50.0),
                              child: Image.network(
                                petData[Constants.petUrlImage],
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          title: Row(
                            children: [
                              SizedBox(
                                width: width * 0.05,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'PetName: ${petData[Constants.petName]}',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: height * 0.01,
                                    ),
                                    Text(
                                      'PetBread: ${petData[Constants.petBreed]}',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: height * 0.01,
                                    ),
                                    Text(
                                      'PetGender: ${petData[Constants.petGender]}',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: height * 0.01,
                                    ),
                                    Text(
                                      'PetNote: ${petData[Constants.petAdditionalNote]}',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: width * 0.01,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'PetHeight: ${petData[Constants.petHeight]}',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: height * 0.01,
                                    ),
                                    Text(
                                      'PetWeight: ${petData[Constants.petWeight]}',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: height * 0.01,
                                    ),
                                    Text(
                                      'PetAge: ${petData[Constants.petAge]}',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return LoadingPage();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
