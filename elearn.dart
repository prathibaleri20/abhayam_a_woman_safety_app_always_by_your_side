import 'package:flutter/material.dart';
import 'video_player.dart';
import 'safety_tips.dart';

class ELearningScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('E-Learning'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildStyledButton(
              context,
              title: 'Basic Self-Defense',
              subtitle: 'Learn basic self-defense techniques.',
              icon: Icons.security,
              color: Colors.blue,
              videoUrl: 'https://youtu.be/M4_8PoRQP8w',
            ),
            _buildStyledButton(
              context,
              title: 'Advanced Self-Defense',
              subtitle: 'Take your skills to the next level.',
              icon: Icons.shield,
              color: Colors.orange,
              videoUrl: 'https://youtu.be/B725c7vi1xk',
            ),
            _buildStyledButton(
              context,
              title: 'Street Safety Tips',
              subtitle: 'Learn how to stay safe in public spaces.',
              icon: Icons.location_on,
              color: Colors.green,
              videoUrl: '',  // You can link to your safety tips page
            ),
          ],
        ),
      ),
    );
  }

  // Reusable function to create styled buttons
  Widget _buildStyledButton(
      BuildContext context, {
        required String title,
        required String subtitle,
        required IconData icon,
        required Color color,
        required String videoUrl,
      }) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        onTap: () {
          if (videoUrl.isNotEmpty) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => VideoPlayerScreen(videoUrl: videoUrl),
              ),
            );
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => StreetSafetyTipsScreen(),
              ),
            );
          }
        },
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
