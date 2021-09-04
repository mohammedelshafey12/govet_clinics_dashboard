import 'package:flutter/material.dart';

import '../../constants.dart';

class CustomDrawerHeader extends StatelessWidget {
  const CustomDrawerHeader({
    Key? key,
    required this.clinicName,
    required this.clinicImageUrl,
    required this.clinicType,
  });
  final clinicName;
  final clinicType;
  final clinicImageUrl;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return DrawerHeader(
      child: Column(
        children: [
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                ),
                child: clinicImageUrl == null
                    ? Icon(
                  Icons.person,
                  size: width * 0.2,
                  color: Colors.black,
                )
                    : Container(
                  width: width * 0.1,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50.0),
                    child: Image.network(
                      clinicImageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: width * 0.04,
              ),
              Expanded(
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
              ),
            ],
          ),
        ],
      ),
    );
  }
}
