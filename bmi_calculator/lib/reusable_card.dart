import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'bmi_page/result_page.dart';
import 'constants.dart';

class ReusableCard extends StatelessWidget {

  Color color;
  final Widget? cardChild;


  ReusableCard({required this.color, this.cardChild});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
      ),
      child: cardChild,
    );
  }
}
