import 'package:flutter/material.dart';
import 'package:nevjegyzek_app/repo/contactList.dart';
import 'package:nevjegyzek_app/screens/contacts_list.dart';

import '../utilities/constants.dart';

class InfoScreen extends StatefulWidget {
  final contact;
  const InfoScreen({super.key, required this.contact});

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  int id = 0;
  String name = '';
  String phoneNumber = '';
  String email = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 260,
                  child: Stack(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 20),
                        height: 185,
                        margin: EdgeInsets.only(top: 6, left: 10, right: 10),
                        decoration: kGradientBackgroundBoxDecoration,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextButton(
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.arrow_back,
                                    color: Color(0xFF7D7D7D),
                                  ),
                                  Text(
                                    'Vissza',
                                    style:
                                        kGrayTextStyle.copyWith(fontSize: 16),
                                  ),
                                ],
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              style: TextButton.styleFrom(
                                padding: const EdgeInsets.only(bottom: 0),
                                maximumSize: Size.fromHeight(57),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 60,
                        left: 0,
                        right: 0,
                        child: Center(
                          child: CircleAvatar(
                            backgroundColor: Color(0xFFFC09ECB),
                            backgroundImage: AssetImage(
                              'assets/images/profile$id.png',
                            ),
                            radius: 100,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Text(
                    name,
                    style: kTitleTextStyle,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 15),
                  child: userData(),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () {},
                    child: Container(
                      decoration: kBoxDecoration,
                      child: SizedBox(
                        height: 84,
                        width: 150,
                        child: Icon(
                          Icons.mail,
                          color: kPurpleColor,
                          size: 44,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: TextButton(
                    onPressed: () {},
                    child: Container(
                      decoration: kBoxDecoration,
                      child: SizedBox(
                        height: 84,
                        width: 150,
                        child: Icon(
                          Icons.phone,
                          color: kPurpleColor,
                          size: 44,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    updateUI(widget.contact);
  }

  void updateUI(dynamic data) {
    this.id = data.id;
    this.name = data.name;
    this.email = data.email;
    this.phoneNumber = data.phoneNumber;
  }

  Widget userData() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Telefonszám:',
          style: kParagraphTextStyle,
        ),
        Text(
          phoneNumber,
          style: kParagraphTextStyle,
        ),
        SizedBox(
          height: 19,
        ),
        Text(
          'E-mail:',
          style: kParagraphTextStyle,
        ),
        Text(
          email,
          style: kParagraphTextStyle,
        )
      ],
    );
  }
}
/*

                          Text(
                          'Vissza',
                          style: kGrayTextStyle.copyWith(fontSize: 16),
                          ),
                        ],
                      ),
                      onPressed: () {},
                      style: TextButton.styleFrom(
                          padding: const EdgeInsets.only(bottom: 0),
                          maximumSize: Size.fromHeight(57)),
                    ),
                  ),
                  Expanded(
                    flex: 54,
                    child: Text(
                      'Névjegyzék',
                      style: TextStyle(
                          fontFamily: 'Besley',
                          fontSize: 32,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
 */
