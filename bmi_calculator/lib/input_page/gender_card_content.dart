import 'package:bmi_calculator/constants.dart';
import 'package:flutter/cupertino.dart';

class genderWidget extends StatelessWidget {

  String label;
  IconData icon;


  genderWidget(this.label, this.icon);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 70,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          label,
          style: kLabelStyle,
        ),
      ],
    );
  }
}