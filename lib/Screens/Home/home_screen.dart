import 'package:flutter/material.dart';
import 'package:govet_clinics_dashboard/Widgets/custom_drawer/custom_drawer.dart';

import 'home_screen_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'GoVet Dashboard',
        ),
      ),
      body: HomeScreenBody(),
      drawer: CustomDrawer(),
    );
  }
}
