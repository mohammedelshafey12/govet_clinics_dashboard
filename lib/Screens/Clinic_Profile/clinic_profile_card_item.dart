import 'package:flutter/material.dart';

import '../../constants.dart';

class ClinicProfileCardItem extends StatelessWidget {
  const ClinicProfileCardItem({
    Key? key,
    required this.title,
    required this.subTitle,
  }) : super(key: key);
  final title;
  final subTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ListTile(
                leading: Text(
                  '$title',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontFamily: 'custom_font_bold',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                title: Center(
                  child: Text(
                    '$subTitle',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontFamily: 'custom_font_bold',
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
