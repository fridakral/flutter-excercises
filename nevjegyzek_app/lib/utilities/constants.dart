import 'package:flutter/material.dart';

const kPurpleColor = Color(0xFFFC09ECB);

const kBackgroundColor = Color(0xFFF7F7F7);

const kGrayTextStyle = TextStyle(
  fontFamily: 'Besley',
  fontSize: 24,
  color: Color(0xFF7D7D7D),
);

const kTitleTextStyle = TextStyle(
  fontFamily: 'Besley',
  fontSize: 32,
  fontWeight: FontWeight.bold
);

const kParagraphTextStyle = TextStyle(
    fontFamily: 'Besley',
    fontSize: 20,
);

const kMyBoxShadow = [
  BoxShadow(
    color: Color(0x19000000),
    blurRadius: 0,
    offset: Offset(0, 0),
    spreadRadius: 0,
  ),
  BoxShadow(
    color: Color(0x19000000),
    blurRadius: 4,
    offset: Offset(1, 1),
    spreadRadius: 0,
  ),
  BoxShadow(
    color: Color(0x16000000),
    blurRadius: 6,
    offset: Offset(4, 5),
    spreadRadius: 0,
  ),
  BoxShadow(
    color: Color(0x0C000000),
    blurRadius: 9,
    offset: Offset(10, 10),
    spreadRadius: 0,
  ),
  BoxShadow(
    color: Color(0x02000000),
    blurRadius: 10,
    offset: Offset(18, 18),
    spreadRadius: 0,
  ),
  BoxShadow(
    color: Color(0x00000000),
    blurRadius: 11,
    offset: Offset(28, 29),
    spreadRadius: 0,
  )
];

const kGradientBackgroundBoxDecoration = BoxDecoration(
  image: DecorationImage(
      image: AssetImage('assets/images/gradient_background.png'),
      fit: BoxFit.fill),
  shape: BoxShape.rectangle,
  boxShadow: kMyBoxShadow,
  borderRadius: BorderRadius.only(
    topRight: Radius.circular(27),
    bottomLeft: Radius.circular(27),
  ),
);

const kBoxDecoration = BoxDecoration(
  boxShadow: kMyBoxShadow,
  color: kBackgroundColor,
  shape: BoxShape.rectangle,
  borderRadius: BorderRadius.only(
    topRight: Radius.circular(27),
    bottomLeft: Radius.circular(27),
  ),
);


const kDivider = Divider(
  color: Color.fromARGB(51, 37, 37, 37),
  indent: 0,
  endIndent: 7,
  thickness: 1,
);
