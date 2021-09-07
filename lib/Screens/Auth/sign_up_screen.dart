import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:govet_clinics_dashboard/Models/clinic_model.dart';
import 'package:govet_clinics_dashboard/Provider/model_hud.dart';
import 'package:govet_clinics_dashboard/Screens/Auth/log_in_screen.dart';
import 'package:govet_clinics_dashboard/Services/auth.dart';
import 'package:govet_clinics_dashboard/Services/store.dart';
import 'package:govet_clinics_dashboard/Widgets/sign_up_custom_text_form_field.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../constants.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key? key}) : super(key: key);
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController clinicNameController = TextEditingController();
  TextEditingController clinicEmailController = TextEditingController();
  TextEditingController clinicPhoneController = TextEditingController();
  TextEditingController clinicTypeController = TextEditingController();
  TextEditingController clinicAboutController = TextEditingController();
  TextEditingController clinicExperienceController = TextEditingController();
  TextEditingController clinicLocationController = TextEditingController();
  TextEditingController clinicPriceController = TextEditingController();
  TextEditingController clinicPasswordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  bool visibleText = true;
  Auth _auth = Auth();
  Store _store = Store();
  GeoPoint? location;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return ModalProgressHUD(
      inAsyncCall: Provider.of<ModelHud>(context).isLoading1,
      child: Scaffold(
        body: Center(
          child: Container(
            width: width * 0.75,
            height: height * 0.9,
            child: Card(
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              color: Colors.white,
              child: Center(
                child: Form(
                  key: formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Sign Up',
                                      style: TextStyle(
                                        fontSize: 25.0,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'custom_font_bold',
                                      ),
                                    ),
                                    SizedBox(
                                      height: height * 0.02,
                                    ),
                                    Text(
                                      'Please fill below the required data to create an account for your Clinics',
                                      style: TextStyle(
                                        color: Colors.grey[400],
                                        fontWeight: FontWeight.w400,
                                        fontSize: 13.0,
                                        fontFamily: 'custom_font',
                                      ),
                                    ),
                                    SizedBox(
                                      height: height * 0.05,
                                    ),
                                    SignUpCustomTextFormField(
                                      title: 'Clinic Name',
                                      controller: clinicNameController,
                                      keyboardType: TextInputType.text,
                                    ),
                                    SizedBox(
                                      height: height * 0.02,
                                    ),
                                    SignUpCustomTextFormField(
                                      title: 'Clinic Email',
                                      controller: clinicEmailController,
                                      keyboardType: TextInputType.emailAddress,
                                    ),
                                    SizedBox(
                                      height: height * 0.02,
                                    ),
                                    SignUpCustomTextFormField(
                                      title: 'Clinic Phone',
                                      controller: clinicPhoneController,
                                      keyboardType: TextInputType.number,
                                    ),
                                    SizedBox(
                                      height: height * 0.02,
                                    ),
                                    TextFormField(
                                      controller: clinicPasswordController,
                                      obscureText: visibleText,
                                      keyboardType:
                                      TextInputType.visiblePassword,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Password Required';
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                        hintText: 'Password ...',
                                        border: OutlineInputBorder(
                                          borderRadius:
                                          BorderRadius.circular(10.0),
                                        ),
                                        prefixIcon: Icon(Icons.lock),
                                        suffixIcon: IconButton(
                                          onPressed: () {
                                            setState(() {
                                              visibleText = !visibleText;
                                            });
                                          },
                                          icon: Icon(
                                            visibleText
                                                ? Icons.visibility
                                                : Icons.visibility_off,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Clinic Information',
                                      style: TextStyle(
                                        fontSize: 25.0,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'custom_font_bold',
                                      ),
                                    ),
                                    SizedBox(
                                      height: height * 0.02,
                                    ),
                                    Text(
                                      'Please fill this fields to add Information clinic',
                                      style: TextStyle(
                                        color: Colors.grey[400],
                                        fontWeight: FontWeight.w400,
                                        fontSize: 13.0,
                                        fontFamily: 'custom_font',
                                      ),
                                    ),
                                    SizedBox(
                                      height: height * 0.05,
                                    ),
                                    SignUpCustomTextFormField(
                                      title: 'Clinic Type',
                                      controller: clinicTypeController,
                                      keyboardType: TextInputType.text,
                                    ),
                                    SizedBox(
                                      height: height * 0.02,
                                    ),
                                    SignUpCustomTextFormField(
                                      title: 'Clinic Price',
                                      controller: clinicPriceController,
                                      keyboardType: TextInputType.number,
                                    ),
                                    SizedBox(
                                      height: height * 0.02,
                                    ),
                                    SignUpCustomTextFormField(
                                      title: 'Clinic About',
                                      controller: clinicAboutController,
                                      keyboardType: TextInputType.number,
                                    ),
                                    SizedBox(
                                      height: height * 0.02,
                                    ),
                                    SignUpCustomTextFormField(
                                      title: 'Clinic Experience',
                                      controller: clinicExperienceController,
                                      keyboardType: TextInputType.text,
                                    ),
                                    SizedBox(
                                      height: height * 0.02,
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        LocationPermission permission =
                                        await Geolocator.checkPermission();
                                        if (permission ==
                                            LocationPermission.denied) {
                                          permission = await Geolocator
                                              .requestPermission();
                                          if (permission ==
                                              LocationPermission.denied) {
                                            // Permissions are denied, next time you could try
                                            // requesting permissions again (this is also where
                                            // Android's shouldShowRequestPermissionRationale
                                            // returned true. According to Android guidelines
                                            // your App should show an explanatory UI now.
                                            return Future.error(
                                                'Location permissions are denied');
                                          }
                                        }

                                        if (permission ==
                                            LocationPermission.deniedForever) {
                                          // Permissions are denied forever, handle appropriately.
                                          return Future.error(
                                              'Location permissions are permanently denied, we cannot request permissions.');
                                        }

                                        // When we reach here, permissions are granted and we can
                                        // continue accessing the position of the device.
                                        var location2 = await Geolocator
                                            .getCurrentPosition();
                                        print(location2.longitude);
                                        print(location2.latitude);
                                        setState(() {
                                          location = GeoPoint(
                                              location2.latitude,
                                              location2.longitude);
                                        });
                                      },
                                      child: TextFormField(
                                        enabled: false,
                                        keyboardType: TextInputType.text,
                                        decoration: InputDecoration(
                                          hintText:
                                          'Click to Pic your Location',
                                          border: OutlineInputBorder(
                                            borderRadius:
                                            BorderRadius.circular(10.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              10.0,
                            ),
                            border: Border.all(
                              color: Colors.blue,
                            ),
                            color: Colors.blue,
                          ),
                          width: width * 0.5,
                          height: 50.0,
                          child: MaterialButton(
                              height: 50.0,
                              child: Text(
                                'Sign In',
                                style: TextStyle(
                                  fontSize: 18,
                                  letterSpacing: 0.5,
                                  color: Colors.white,
                                ),
                              ),
                              onPressed: () async {
                                if (formKey.currentState!.validate()) {
                                  final modelHud = Provider.of<ModelHud>(
                                    context,
                                    listen: false,
                                  );
                                  modelHud.isProgressLoading(true);
                                  try {
                                    final authResult =
                                    await _auth.signUpWithEmailAndPassword(
                                      clinicEmailController.text,
                                      clinicPasswordController.text,
                                      context,
                                    );
                                    User? userAuth =
                                    FirebaseAuth.instance.currentUser!;
                                    _store.addClinic(
                                      ClinicModel(
                                        clinicId: userAuth.uid,
                                        clinicEmail: userAuth.email,
                                        clinicName: clinicNameController.text,
                                        clinicPhone: clinicPhoneController.text,
                                        clinicType: clinicTypeController.text,
                                        clinicAbout: clinicAboutController.text,
                                        clinicExperience: clinicExperienceController.text,
                                        clinicLocation: location??null,
                                        clinicPrice: clinicPriceController.text,
                                        clinicImageUrl: null,
                                        clinicIsVerify: false,
                                      ),
                                    );
                                    modelHud.isProgressLoading(false);
                                  } on PlatformException catch (e) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          e.message.toString(),
                                          style: TextStyle(
                                              fontFamily: 'custom_font'),
                                        ),
                                      ),
                                    );
                                    modelHud.isProgressLoading(false);
                                  }
                                }
                              }
                          ),
                        ),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'If you have an account',
                              style: TextStyle(
                                fontFamily: 'custom_font',
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                            TextButton(
                              onPressed: () {
                                Constants.navigatorPush(
                                  context: context,
                                  screen: LogInScreen(),
                                );
                              },
                              child: Text(
                                'Sign In',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'custom_font_bold',
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: height * 0.009,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}