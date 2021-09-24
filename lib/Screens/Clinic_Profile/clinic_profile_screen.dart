import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:govet_clinics_dashboard/Provider/model_hud.dart';
import 'package:govet_clinics_dashboard/Screens/Clinic_Profile/clinic_profile_card_item.dart';
import 'package:govet_clinics_dashboard/Widgets/loading_page.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';

class ClinicProfileScreen extends StatefulWidget {
  const ClinicProfileScreen({Key? key}) : super(key: key);

  @override
  State<ClinicProfileScreen> createState() => _ClinicProfileScreenState();
}

class _ClinicProfileScreenState extends State<ClinicProfileScreen> {
  var _image;
  String? clinicUrlImage;
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
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Clinic Profile',
        ),
      ),
      body: Center(
        child: Container(
          width: width * 0.7,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection(Constants.clinicCollection).where(Constants.clinicId, isEqualTo: uid).snapshots(),
              builder: (context, snapshot){
                if (snapshot.hasData){
                  var clinicData = snapshot.data!.docs[0];
                  print(clinicData);
                  return ListView(
                    children: [
                      Center(
                        child: Container(
                          height: height * 0.25,
                          width: width * 0.25,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 2),
                            shape: BoxShape.circle,
                          ),
                          child: InkWell(
                            onTap: () {
                              _imgFromGallery();
                            },
                            child: CircleAvatar(
                              backgroundColor: Colors.black,
                              radius: 50.0,
                              child: clinicData[Constants.clinicImageUrl] == null &&
                                  _image == null
                                  ? Icon(
                                Icons.add_a_photo,
                                color: Colors.white,
                                size: 50,
                              ) : clinicData[Constants.clinicImageUrl] == null &&
                                  _image != null
                                  ? Icon(
                                Icons.cloud_done,
                                color: Colors.white,
                                size: 50,
                              )
                                  : ClipRRect(
                                borderRadius: BorderRadius.circular(50.0),
                                child: Image.network(
                                  clinicData[Constants.clinicImageUrl],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: width * 0.25,
                          ),
                          Expanded(
                            child: Center(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: Color(0xfff01033F),
                                ),
                                padding: const EdgeInsets.all(10.0),
                                child: InkWell(
                                  onTap: () {
                                    if (_image == null) {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            "Please Upload your Photo",
                                            style:
                                            TextStyle(fontFamily: 'custom_Font'),
                                          ),
                                        ),
                                      );
                                    } else {
                                      uploadFile();
                                    }
                                  },
                                  child: Text(
                                    "Upload Photo",
                                    style: TextStyle(
                                      fontFamily: 'custom_font',
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: width * 0.25,
                          ),
                        ],
                      ),
                      ClinicProfileCardItem(
                        title: 'ClinicName',
                        subTitle: clinicData[Constants.clinicName],
                      ),
                      ClinicProfileCardItem(
                        title: 'ClinicEmail',
                        subTitle: clinicData[Constants.clinicEmail],
                      ),
                      ClinicProfileCardItem(
                        title: 'ClinicPhone',
                        subTitle: clinicData[Constants.clinicPhone],
                      ),
                      ClinicProfileCardItem(
                        title: 'ClinicType',
                        subTitle: clinicData[Constants.clinicServices],
                      ),
                      ClinicProfileCardItem(
                        title: 'ClinicLocation',
                        subTitle: clinicData[Constants.clinicLocation],
                      ),
                      ClinicProfileCardItem(
                        title: 'ClinicPrice',
                        subTitle: clinicData[Constants.clinicOldPrice],
                      ),
                    ],
                  );
                } else {
                  return LoadingPage();
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  _imgFromGallery() async {
    Uint8List? fromPicker;
    fromPicker = (await ImagePickerWeb.getImage(outputType: ImageType.bytes)) as Uint8List?;

    // var image;
    // image = await ImagePicker().getImage(
    //   source: ImageSource.gallery,
    // );

    setState(() {
      _image = fromPicker;
    });
  }
  //
  // Future<void> _getImage() async {
  //   final PickedFile? pickedFile = await ImagePicker().getImage(source: ImageSource.gallery);
  //   setState(() {
  //     if (pickedFile != null) {
  //       print(pickedFile.);
  //        // _image = File(pickedFile.path);
  //
  //     } else {
  //       print("No image selected");
  //     }
  //   });
  // }


  Future uploadFile() async {
    if (_image != null) {
      Provider.of<ModelHud>(context, listen: false).isProgressLoading(true);
      User? userAuth = FirebaseAuth.instance.currentUser;
      final feedStorage = FirebaseStorage.instanceFor();
      Reference refFeedBucket = feedStorage
          .ref()
          .child(userAuth!.uid);
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            content: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Upload Your Photo ..',
                  style: TextStyle(
                    fontFamily: 'custom_font',
                  ),
                ),
                CircularProgressIndicator(),
              ],
            ),
          );
        },
      );
      var uploadedFile = await refFeedBucket.putData(_image);

      if (uploadedFile.state == TaskState.success) {
        String downloadUrl = '';
        downloadUrl = await refFeedBucket.getDownloadURL();
        Provider.of<ModelHud>(context, listen: false).isProgressLoading(false);
        FirebaseFirestore.instance
          ..collection(Constants.clinicCollection).doc(userAuth.uid).update({
            Constants.clinicImageUrl: downloadUrl,
          }).whenComplete(() {
            Navigator.pop(context);
          });
        Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Text(
              "Photo Uploaded ",
              style: TextStyle(
                fontFamily: 'custom_font',
              ),
            ),
          ),
        );
      }
    } else {
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "First pick Image By click on photo",
            style: TextStyle(
              fontFamily: 'custom_font',
            ),
          ),
        ),
      );
    }
  }


}
