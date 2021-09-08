import 'package:flutter/material.dart';
import 'package:govet_clinics_dashboard/Screens/old_reservation/old_reservation_screen.dart';
import 'package:govet_clinics_dashboard/Screens/verify_reservation/verify_reservation_screen.dart';
import 'package:govet_clinics_dashboard/constants.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Center(
      child: Container(
        height: height * 0.7,
        width: width * 0.5,
        child: Column(
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                child: Card(
                  elevation: 3.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(10.0),
                    onTap: () {
                      Constants.navigatorPush(
                        context: context,
                        screen: VerifyReservationScreen(),
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.mobile_friendly,
                          size: height * 0.1,
                        ),
                        Text(
                          'Verify Reservation',
                          style: TextStyle(
                            fontFamily: 'custom_font_bold',
                            letterSpacing: 0.3,
                            fontSize: 18.0,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.1,
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                child: Card(
                  elevation: 3.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(10.0),
                    onTap: () {
                      Constants.navigatorPush(
                        context: context,
                        screen: OldReservationScreen(),
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.book,
                          size: height * 0.1,
                        ),
                        Text(
                          'Old Reservations',
                          style: TextStyle(
                            fontFamily: 'custom_font_bold',
                            letterSpacing: 0.3,
                            fontSize: 18.0,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
