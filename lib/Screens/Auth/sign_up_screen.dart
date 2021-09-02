import 'package:flutter/material.dart';
import 'package:govet_clinics_dashboard/Provider/model_hud.dart';
import 'package:govet_clinics_dashboard/Screens/Auth/log_in_screen.dart';
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
                                        if (value == null ||
                                            value.isEmpty) {
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
                                          borderRadius: BorderRadius.circular(10.0),
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
                        onPressed: (){
                          if (formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Processing Data')));
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
                                builder: (context) =>
                                    LogInScreen(),
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
