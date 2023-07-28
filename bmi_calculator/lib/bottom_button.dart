
import 'package:flutter/material.dart';

import 'bmi_page/result_page.dart';
import 'constants.dart';

class BottomButton extends StatelessWidget {

  final VoidCallback function;
  final String label;


  BottomButton(this.function, this.label);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.only(bottom: 10),
        color: kPrimaryColor,
        height: 70,
        width: double.infinity,
        margin: const EdgeInsets.only(top: 10),
        child:  Center(
          child: Text(
            label,
            style: TextStyle(
                color: Colors.white,
                fontSize: 20
            ),
          ),
        ),
      ),
      onTap: function,
    );
  }
}