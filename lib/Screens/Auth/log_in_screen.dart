import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:govet_clinics_dashboard/Provider/model_hud.dart';
import 'package:govet_clinics_dashboard/Screens/Auth/sign_up_screen.dart';
import 'package:govet_clinics_dashboard/Services/auth.dart';
import 'package:govet_clinics_dashboard/Services/store.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';

class LogInScreen extends StatefulWidget {
  LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
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
            width: width * 0.7,
            height: height * 0.7,
            child: Card(
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              color: Colors.white,
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: height,
                              child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15.0),
                                  bottomLeft: Radius.circular(15.0),
                                ),
                                child: Image.asset(
                                  Constants.logInPhoto,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: ListView(
                             padding: const EdgeInsets.all(20.0),children: [
                              Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Sign In',
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
                                    'Please fill below the required data to log in Dashboard',
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
                                  TextFormField(
                                    controller: emailController,
                                    obscureText: false,
                                    keyboardType:
                                    TextInputType.emailAddress,
                                    validator: (value) {
                                      if (value == null ||
                                          value.isEmpty) {
                                        return 'Email must be not empty';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      hintText: 'Email ...',
                                      border: OutlineInputBorder(
                                        borderRadius:
                                        BorderRadius.circular(10.0),
                                      ),
                                      prefixIcon: Icon(Icons.email),
                                    ),
                                  ),
                                  SizedBox(
                                    height: height * 0.03,
                                  ),
                                  TextFormField(
                                    controller: passwordController,
                                    obscureText: visibleText,
                                    keyboardType:
                                    TextInputType.visiblePassword,
                                    validator: (value) {
                                      if (value == null ||
                                          value.isEmpty) {
                                        return 'password must be not empty';
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
                                  SizedBox(
                                    height: height * 0.03,
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
                                    width: width,
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
                                          final modelHud = Provider.of<ModelHud>(context,
                                              listen: false,);
                                          modelHud.isProgressLoading(true);
                                          try {
                                            final authResult = await _auth
                                                .signInWithEmailAndPassword(
                                                emailController.text.trim(),
                                                passwordController.text.trim(),
                                                context,);

                                            modelHud.isProgressLoading(false);
                                            User? userAuth = FirebaseAuth.instance.currentUser;
                                            // print(auth1.currentUser!.uid);
                                          } on PlatformException catch (e) {
                                            Scaffold.of(context).showSnackBar(SnackBar(
                                              content: Text(
                                                e.message.toString(),
                                                style: TextStyle(fontFamily: 'custom_font'),
                                              ),
                                            ));
                                            modelHud.isProgressLoading(false);
                                          }
                                        }
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: height * 0.05,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Text(
                                      'If you don\'t have an account',
                                      style: TextStyle(
                                        fontFamily: 'custom_font',
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              SignUpScreen(),
                                        ),
                                      );
                                    },
                                    child: Text(
                                      'Sign Up',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'custom_font_bold',
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                            ),
                          ),
                        ],
                      ),
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
