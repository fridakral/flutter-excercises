import 'package:flutter/material.dart';
import 'package:nevjegyzek_app/screens/contacts_list.dart';

import '../utilities/constants.dart';

class ContactsScreen extends StatelessWidget {
  const ContactsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.large(
        onPressed: (){},
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage('assets/images/gradient_background.png'),
              fit: BoxFit.fill
            ),
          ),
          child: Icon(
            Icons.add,
            size: 100,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              alignment: Alignment.bottomLeft,
              padding: EdgeInsets.only(left: 20),
              height: 87,
              margin: EdgeInsets.only(top: 6, left: 10, right: 10),
              decoration: kGradientBackgroundBoxDecoration,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 24,
                    child: TextButton(
                      child: Row(
                        children: [
                          Icon(
                            Icons.arrow_back,
                            color: Color(0xFF7D7D7D),
                          ),
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
                      style: kTitleTextStyle
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top:19, left:25, right: 25,),
              padding: EdgeInsets.only(left: 11),
              height: 39,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.all(
                  Radius.circular(9)
                ),
                color: Color.fromARGB(100, 217, 217, 217),
                boxShadow: const  [
                  BoxShadow(
                    color: Color(0x23000000),
                    blurRadius: 1,
                    offset: Offset(1, 1),
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: Text(
                'Keresés',
                style: kGrayTextStyle,
              ),
            ),
            ContactList()
          ],
        ),

      ),
    );
  }
}
