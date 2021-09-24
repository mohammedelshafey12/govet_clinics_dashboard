import 'package:flutter/material.dart';

class ReservationUserDataCardItem extends StatelessWidget {
  const ReservationUserDataCardItem({
    Key? key,
    required this.title,
    required this.subTitle,
  });

  final title;
  final subTitle;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        title: Center(
          child: Text(
            subTitle,
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
