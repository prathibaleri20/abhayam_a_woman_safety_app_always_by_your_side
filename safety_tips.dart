import 'package:flutter/material.dart';

class StreetSafetyTipsScreen extends StatelessWidget {
  final List<String> tips = [
    'Be aware of your surroundings at all times.',
    'Avoid walking alone in poorly lit areas.',
    'Keep emergency numbers handy.',
    'Carry a personal safety alarm or pepper spray.',
    'Trust your instincts and avoid unsafe situations.',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Street Safety Tips'),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: tips.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              child: ListTile(
                leading: Icon(Icons.check_circle, color: Colors.green),
                title: Text(
                  tips[index],
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
