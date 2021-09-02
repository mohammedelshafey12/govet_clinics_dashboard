import 'package:flutter/material.dart';

class VerifyReservationScreen extends StatelessWidget {
  const VerifyReservationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Verify Reservation',
        ),
      ),
    );
  }
}
