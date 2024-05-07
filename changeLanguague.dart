import 'package:flutter/material.dart';

class LanguageChangePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Change Language'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            LanguageOption(
              language: 'English',
              onPressed: () {
                // logik
              },
            ),
            SizedBox(height: 16.0),
            LanguageOption(
              language: 'Indonesian',
              onPressed: () {
                // logik
              },
            ),
          ],
        ),
      ),
    );
  }
}

class LanguageOption extends StatelessWidget {
  final String language;
  final VoidCallback onPressed;

  const LanguageOption({
    required this.language,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(language),
    );
  }
}
