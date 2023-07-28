import 'package:bmi_calculator/bmi_page/result_page.dart';
import 'package:bmi_calculator/bmi_page/calculator_brain.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../bottom_button.dart';
import '../constants.dart';
import 'enums.dart';
import 'gender_card_content.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int height = 180;
  Gender? selectedGender;
  int weight = 90;
  int age = 24;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
                    onTap: () {
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
                    onTap: () {
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
                        height.toString(),
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
                    value: height.toDouble(),
                    min: 50.0,
                    max: 250.0,
                    onChanged: (double newValue) {
                      setState(() {
                        height = newValue.round();
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
                Expanded(
                  child: ReusableCard(
                    color: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'WEIGHT',
                          style: kLabelStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(Icons.remove, () {
                              setState(() {
                                weight--;
                              });
                            }),
                            const SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(Icons.add, () {
                              setState(() {
                                weight++;
                              });
                            }),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'AGE',
                          style: kLabelStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(Icons.remove, () {
                              setState(() {
                                age--;
                              });
                            }),
                            const SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(Icons.add, () {
                              setState(() {
                                age++;
                              });
                            }),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(() {
            CalculatorBrain calc = CalculatorBrain(height: height, weight: weight);

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ResultPage(calc.calculateBmi(), calc.getResult(), calc.getInterpretation()),
              ),
            );
          }, 'CALCULATE')
        ],
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback function;

  RoundIconButton(this.icon, this.function);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: const BoxConstraints.tightFor(width: 56.0, height: 56.0),
      onPressed: function,
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      child: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }
}
