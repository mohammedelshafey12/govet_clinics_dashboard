import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:govet_clinics_dashboard/Models/clinic_model.dart';
import 'package:govet_clinics_dashboard/Provider/model_hud.dart';
import 'package:govet_clinics_dashboard/Screens/Auth/log_in_screen.dart';
import 'package:govet_clinics_dashboard/Services/auth.dart';
import 'package:govet_clinics_dashboard/Services/store.dart';
import 'package:govet_clinics_dashboard/Widgets/sign_up_custom_text_form_field.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

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

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return ModalProgressHUD(
      inAsyncCall: Provider.of<ModelHud>(context).isLoading,
      child: Scaffold(
        body: Center(
          child: Container(
            width: width * 0.75,
            height: height * 0.85,
            child: Card(
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              color: Colors.white,
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: ListView(
                              padding: const EdgeInsets.all(20.0),
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                              ],
                            ),
                          ),
                          Expanded(
                            child: ListView(
                              padding: const EdgeInsets.all(20.0),
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                    TextFormField(
                                      controller: clinicLocationController,
                                      keyboardType: TextInputType.text,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Location Required';
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                        hintText: 'Click to Pic your Location',
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height * 0.02,
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
                              modelHud.isProgressLoading(false);
                              User? userAuth = await FirebaseAuth.instance.currentUser!;
                              _store.addClinic(
                                ClinicModel(
                                  clinicId: userAuth.uid,
                                  clinicEmail: userAuth.email,
                                  clinicName: clinicNameController.text,
                                  clinicPhone: clinicPhoneController.text,
                                  clinicType: clinicTypeController.text,
                                  clinicAbout: clinicAboutController.text,
                                  clinicExperience:
                                      clinicExperienceController.text,
                                  clinicLocation: clinicLocationController.text,
                                  clinicPrice: clinicPriceController.text,
                                ),
                              );
                            } on PlatformException catch (e) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    e.message.toString(),
                                    style: TextStyle(fontFamily: 'custom_font'),
                                  ),
                                ),
                              );
                              modelHud.isProgressLoading(false);
                            }
                            modelHud.isProgressLoading(false);
                          }
                        },
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LogInScreen(),
                              ),
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
    );
  }
}
