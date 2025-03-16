import 'package:flutter/material.dart';

class EmergencyContactsScreen extends StatelessWidget {
  final List<Map<String, String>> contacts = [
    {'name': 'Police', 'contact': '100'},
    {'name': 'Women Helpline', 'contact': '1091'},
    {'name': 'Ambulance', 'contact': '102'},
    {'name': 'Fire Brigade', 'contact': '101'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Emergency Contacts'),
        backgroundColor: Colors.purple,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          final contact = contacts[index];
          return Card(
            elevation: 4,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: ListTile(
              leading: Icon(Icons.phone, color: Colors.red, size: 40),
              title: Text(contact['name']!, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              subtitle: Text(contact['contact']!),
              trailing: Icon(Icons.call, color: Colors.green),
              onTap: () {
                // Add functionality to call the contact
              },
            ),
          );
        },
      ),
    );
  }
}
