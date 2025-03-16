import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:url_launcher/url_launcher.dart';

class LocationSharingScreen extends StatelessWidget {
  // Function to share the current location with multiple recipients
  Future<void> shareLocation() async {
    final location = Location();
    try {
      // Request location access
      bool serviceEnabled = await location.serviceEnabled();
      if (!serviceEnabled) {
        serviceEnabled = await location.requestService();
        if (!serviceEnabled) {
          return;
        }
      }

      PermissionStatus permissionGranted = await location.hasPermission();
      if (permissionGranted == PermissionStatus.denied) {
        permissionGranted = await location.requestPermission();
        if (permissionGranted != PermissionStatus.granted) {
          return;
        }
      }

      // Get the location data
      final locationData = await location.getLocation();

      // List of phone numbers to share the location
      List<String> phoneNumbers = [
        '+91 9844283575',
        '+91 8660489690',
        '+91 8714791185',
      ];

      // Iterate through each phone number and send the location
      for (String number in phoneNumbers) {
        final uri = Uri(
          scheme: 'sms',
          path: number,
          queryParameters: {
            'body':
            'My location: https://www.google.com/maps?q=${locationData.latitude},${locationData.longitude}',
          },
        );

        // Launch the SMS application with the location link
        if (await canLaunchUrl(uri)) {
          await launchUrl(uri);
        } else {
          print("Could not launch the URL for $number.");
        }
      }
    } catch (e) {
      print('Error sharing location: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Location Sharing'),
        backgroundColor: Colors.purple,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 20),
          Text(
            'Share Your Current Location',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Icon(Icons.location_on, size: 100, color: Colors.purple),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'You can share your live location with your trusted contacts to keep them informed about your whereabouts.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
          ),
          SizedBox(height: 30),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.purple,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
            ),
            onPressed: shareLocation,
            child: Text('Share Location', style: TextStyle(fontSize: 18)),
          ),
        ],
      ),
    );
  }
}
