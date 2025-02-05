import 'package:flutter/material.dart';
import 'package:ostad_assignment_2/models/Contact.dart';
import 'package:ostad_assignment_2/widgets/ContactTile.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  final List<Contact> _contacts = [];
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _numController = TextEditingController();

  void _addContact() {
    final name = _nameController.text;
    final num = _numController.text;

    if (name.isEmpty || num.isEmpty) return;
    setState(
      () {
        _contacts.add(
          Contact(name: name, num: num),
        );
        _nameController.clear();
        _numController.clear();
      },
    );
  }

  void _deleteContact(int index) {
    setState(() {
      _contacts.removeAt(index);
    });
  }

  void _confirmDelete(int index) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Confirmation'),
        content: Text('Are you sure for Delete'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              _deleteContact(index);
              Navigator.of(ctx).pop();
            },
            child: Text('Delete'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contact List"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(labelText: 'Name'),
                ),
                TextField(
                  controller: _numController,
                  decoration: InputDecoration(labelText: 'Number'),
                  keyboardType: TextInputType.phone,
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: _addContact,
                  child: Text('Add'),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _contacts.length,
              itemBuilder: (ctx, index) => GestureDetector(
                onLongPress: () => _confirmDelete(index),
                child: ContactTile(
                  contact: _contacts[index],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
