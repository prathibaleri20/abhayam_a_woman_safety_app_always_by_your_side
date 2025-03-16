import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class NearbyGuardianScreen extends StatefulWidget {
  @override
  _NearbyGuardianScreenState createState() => _NearbyGuardianScreenState();
}

class _NearbyGuardianScreenState extends State<NearbyGuardianScreen> {
  // List of guardians with their names, contact numbers, and distances
  final List<Map<String, String>> guardians = [
    {'name': 'Prathiksha', 'contact': '6362514467', 'distance': '500m away'},
    {'name': 'Melisha', 'contact': '9844283575', 'distance': '1.2km away'},
    {'name': 'Thrisha', 'contact': '8660489690', 'distance': '1.5km away'},
    {'name': 'Diya', 'contact': '8714791185', 'distance': '1000m away'},
  ];

  // Function to initiate the phone call
  Future<void> _callGuardian(String contact) async {
    final Uri phoneUri = Uri(
      scheme: 'tel',
      path: contact,
    );
    if (await canLaunch(phoneUri.toString())) {
      await launch(phoneUri.toString());
    } else {
      // Show an error if the phone call can't be launched
      throw 'Could not place a call to $contact';
    }
  }

  // Function to show a dialog to add a new guardian
  void _showAddGuardianDialog() {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController contactController = TextEditingController();
    final TextEditingController distanceController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add Guardian'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: contactController,
                decoration: InputDecoration(labelText: 'Contact Number'),
                keyboardType: TextInputType.phone,
              ),
              TextField(
                controller: distanceController,
                decoration: InputDecoration(labelText: 'Distance'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (nameController.text.isNotEmpty &&
                    contactController.text.isNotEmpty &&
                    distanceController.text.isNotEmpty) {
                  setState(() {
                    guardians.add({
                      'name': nameController.text,
                      'contact': contactController.text,
                      'distance': distanceController.text,
                    });
                  });
                  Navigator.of(context).pop();
                }
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }

  // Function to remove a guardian from the list
  void _removeGuardian(int index) {
    setState(() {
      guardians.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nearby Guardians'),
        backgroundColor: Colors.purple,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemCount: guardians.length,
        itemBuilder: (context, index) {
          final guardian = guardians[index];
          return Card(
            elevation: 4,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: ListTile(
              leading: Icon(Icons.person, color: Colors.purple, size: 40),
              title: Text(
                guardian['name']!,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: Text('${guardian['distance']} - ${guardian['contact']}'),
              trailing: IconButton(
                icon: Icon(Icons.phone, color: Colors.green),
                onPressed: () {
                  // Trigger the call functionality when tapped
                  _callGuardian(guardian['contact']!);
                },
              ),
            ),
          );
        },
      ),
      // This is the Delete Guardian Button, placed separately
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () {
            // Show confirmation dialog to delete all guardians
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text('Delete Guardians'),
                  content: Text('Are you sure you want to delete all guardians?'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          guardians.clear();  // Clears all guardians
                        });
                        Navigator.of(context).pop();
                      },
                      child: Text('Delete All'),
                    ),
                  ],
                );
              },
            );
          },
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: EdgeInsets.symmetric(vertical: 15),
          ),
          child: Text(
            'Delete All Guardians',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddGuardianDialog,
        backgroundColor: Colors.purple,
        child: Icon(Icons.add),
      ),
    );
  }
}
