import 'package:flutter/material.dart';
import 'package:nevjegyzek_app/entities/contact_entity.dart';
import 'package:nevjegyzek_app/repo/contactList.dart';
import 'package:nevjegyzek_app/utilities/constants.dart';

import 'info_screen.dart';

class ContactList extends StatefulWidget {
  const ContactList({super.key});

  @override
  State<ContactList> createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  AllContacts allContacts = AllContacts();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(21.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: getData(),
      ),
    );
  }

  getData() {
    Map contacts = allContacts.contacts;

    List<String> letters = [];

    List<Widget> contactList = [];

    for (var key in contacts.keys) {
      letters.add(key);
    }

    for (String letter in letters) {
      contactList.add(Text(
        letter,
        style: kGrayTextStyle.copyWith(color: Colors.black),
      ));
      for (ContactEntity contact in contacts[letter]) {
        contactList.add(createContactWidget(contact));
        contactList.add(kDivider);
      }
    }

    return contactList;
  }

  createContactWidget(ContactEntity entity) {
    return TextButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context){

            return InfoScreen(contact: entity);
          }));
        },
        child: Text(
          entity.name,
          style: kGrayTextStyle,
        ));
  }
}
