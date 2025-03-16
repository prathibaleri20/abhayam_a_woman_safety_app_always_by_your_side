import 'package:flutter/material.dart';

class BasicLawsScreen extends StatelessWidget {
  final List<Map<String, String>> laws = [
    {
      'title': 'Women\'s Protection Laws',
      'description':
      '1. Protection of Women from Domestic Violence Act, 2005\n'
          '2. Sexual Harassment of Women at Workplace Act, 2013\n'
          '3. Dowry Prohibition Act, 1961',
    },
    {
      'title': 'Children\'s Protection Laws',
      'description':
      '1. Protection of Children from Sexual Offenses Act, 2012\n'
          '2. Child Labor (Prohibition and Regulation) Act, 1986',
    },
    {
      'title': 'General Protection Laws',
      'description':
      '1. Right to Information Act, 2005\n'
          '2. Protection of Human Rights Act, 1993\n'
          '3. Indian Penal Code Section 354 (Outraging modesty of a woman)',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Basic Legal Rights'),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: laws.length,
          itemBuilder: (context, index) {
            final law = laws[index];
            return Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: ListTile(
                title: Text(
                  law['title']!,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    law['description']!,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
