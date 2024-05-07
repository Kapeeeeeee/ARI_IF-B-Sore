import 'package:flutter/material.dart';

class AccountSafetyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account Safety'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Account Safety',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            SafetyOption(
              title: '2-Step Authentication',
              description:
                  'Enable additional security measures for your account.',
              onPressed: () {
                // logik
              },
            ),
            SizedBox(height: 16.0),
            SafetyOption(
              title: 'Fingerprint Authentication',
              description:
                  'Use fingerprint authentication to access your account.',
              onPressed: () {
                // logik
              },
            ),
            SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}

class SafetyOption extends StatelessWidget {
  final String title;
  final String description;
  final VoidCallback onPressed;

  const SafetyOption({
    required this.title,
    required this.description,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text(description),
      trailing: IconButton(
        icon: Icon(Icons.arrow_forward),
        onPressed: onPressed,
      ),
    );
  }
}
