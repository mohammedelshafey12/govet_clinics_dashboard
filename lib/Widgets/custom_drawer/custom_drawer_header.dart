import 'package:flutter/material.dart';

class CustomDrawerHeader extends StatelessWidget {
  const CustomDrawerHeader({
    Key? key,
    required this.clinicName,
    required this.clinicType,
  });
  final clinicName;
  final clinicType;

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            '$clinicName',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'custom_font_bold',
              color: Colors.black,
              fontSize: 18,
            ),
          ),
          Text(
            '$clinicType',
            style: TextStyle(
              fontFamily: 'custom_font',
              color: Colors.grey,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
