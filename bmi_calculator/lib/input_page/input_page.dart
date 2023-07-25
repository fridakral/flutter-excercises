import 'package:bmi_calculator/input_page/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants.dart';
import 'enums.dart';
import 'input_page_card_contents/gender_card_content.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  int myHeight = 180;
  Gender? selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('BMI CALCULATOR'),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        selectedGender = Gender.FEMALE;
                      });
                    },
                    child: ReusableCard(
                      color: (selectedGender == Gender.FEMALE)
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      cardChild: genderWidget('FEMALE', FontAwesomeIcons.venus),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        selectedGender = Gender.MALE;
                      });
                    },
                    child: ReusableCard(
                      color: (selectedGender == Gender.MALE)
                          ? kActiveCardColor
                           : kInactiveCardColor,
                      cardChild: genderWidget('MALE', FontAwesomeIcons.mars),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              color: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'HEIGHT',
                    style: kLabelStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        myHeight.toString(),
                        style: kNumberTextStyle,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Text(
                        'cm',
                        style: kLabelStyle,
                      ),
                    ],
                  ),
                  Slider(
                    activeColor: kPrimaryColor,
                    inactiveColor: kSecondaryLabelColor,
                    value: myHeight.toDouble(),
                    min: 50.0,
                    max:250.0,
                    onChanged: (double newValue){
                      setState(() {
                        myHeight = newValue.round();
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(child: ReusableCard(color: kActiveCardColor)),
                Expanded(child: ReusableCard(color: kActiveCardColor))
              ],
            ),
          ),
          Container(
            color: kPrimaryColor,
            height: 80,
            width: double.infinity,
            margin: const EdgeInsets.only(top: 10),
          ),
        ],
      ),
    );
  }
}





