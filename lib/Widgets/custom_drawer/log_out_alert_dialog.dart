import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:govet_clinics_dashboard/Screens/Auth/log_in_screen.dart';

class LogOutAlertDialog extends StatelessWidget {
  const LogOutAlertDialog({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return AlertDialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      content: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: Colors.white,
        ),
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.logout,size: height * 0.1,),
            SizedBox(
              height: height * 0.02,
            ),
            Text(
              'Do you want to sign out ?',
              style: TextStyle(
                fontSize: 24,
                fontFamily: 'custom_font_bold',
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                RaisedButton(
                  color: Colors.green,
                  child: Center(
                    child: Text(
                      "Yes",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'custom_font',
                      ),
                    ),
                  ),
                  onPressed: () {
                    FirebaseAuth auth = FirebaseAuth.instance;
                    auth.signOut().whenComplete(
                          () => Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (context) => LogInScreen(),
                        ),
                            (Route<dynamic> route) => false,
                      ),
                    );
                  },
                ),
                RaisedButton(
                  color: Colors.red,
                  child: Center(
                    child: Text(
                      "No",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'custom_font',
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
