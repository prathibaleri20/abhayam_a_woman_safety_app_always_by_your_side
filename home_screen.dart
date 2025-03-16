import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatelessWidget {
  // Emergency contacts list
  final List<String> emergencyContacts = [
    '+91 9844283575',
    '+91 8660489690',
    '+91 8714791185',
  ];

  // Function to send an SOS alert to all emergency contacts
  Future<void> sendSOS() async {
    try {
      for (String number in emergencyContacts) {
        final uri = Uri(
          scheme: 'sms',
          path: number,
          queryParameters: {
            'body': 'SOS! I need help. Check my location: https://goo.gl/maps/dummy',
          },
        );

        if (await canLaunchUrl(uri)) {
          await launchUrl(uri);
        } else {
          print("Could not send SOS to $number.");
        }
      }
    } catch (e) {
      print('Error sending SOS: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Abhayam'),
        backgroundColor: Colors.deepPurple,
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: Colors.purple[50],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildHomeTile(
              title: 'Panic Button',
              subtitle: 'Send an SOS alert.',
              icon: Icons.warning,
              color: Colors.red,
              onTap: sendSOS,
            ),
            _buildHomeTile(
              title: 'Location Sharing',
              subtitle: 'Share your location with contacts.',
              icon: Icons.location_on,
              color: Colors.blue,
              onTap: () {
                Navigator.pushNamed(context, '/location-sharing');
              },
            ),
            _buildHomeTile(
              title: 'Nearby Guardian',
              subtitle: 'Find and contact nearby guardians.',
              icon: Icons.group,
              color: Colors.green,
              onTap: () {
                Navigator.pushNamed(context, '/nearby-guardian');
              },
            ),
            _buildHomeTile(
              title: 'Basic Laws',
              subtitle: 'Know your rights.',
              icon: Icons.gavel,
              color: Colors.orange,
              onTap: () {
                Navigator.pushNamed(context, '/basic-laws');
              },
            ),
            _buildHomeTile(
              title: 'E-Learning',
              subtitle: 'Learn self-defense techniques.',
              icon: Icons.school,
              color: Colors.purple,
              onTap: () {
                Navigator.pushNamed(context, '/e-learning');
              },
            ),
          ],
        ),
      ),
    );
  }

  // Helper widget to create a home screen tile
  Widget _buildHomeTile({
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(15),
        child: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [color.withOpacity(0.7), color],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: [
              Icon(icon, size: 40, color: Colors.white),
              SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
