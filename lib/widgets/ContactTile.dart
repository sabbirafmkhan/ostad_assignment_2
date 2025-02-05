import 'package:flutter/material.dart';
import 'package:ostad_assignment_2/models/Contact.dart';

class ContactTile extends StatelessWidget {
  final Contact contact;
  const ContactTile({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.person),
      title: Text(contact.name),
      subtitle: Text(contact.num),
      trailing: Icon(Icons.phone),
    );
  }
}
