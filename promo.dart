import 'package:flutter/material.dart';

class PromoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Promo'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            PromoCard(
              promoCode: 'FREEDELIVERY',
              description: 'Free delivery on your next order',
              validity: 'Valid until 30 April 2024',
              onPressed: () {
                // Add logic to claim promo
              },
            ),
            SizedBox(height: 16.0),
            PromoCard(
              promoCode: '10OFF',
              description: 'Get 10% off on your next purchase',
              validity: 'Valid until 15 May 2024',
              onPressed: () {
                // Add logic to claim promo
              },
            ),
            // Add more PromoCard widgets for additional promos
          ],
        ),
      ),
    );
  }
}

class PromoCard extends StatelessWidget {
  final String promoCode;
  final String description;
  final String validity;
  final VoidCallback onPressed;

  const PromoCard({
    required this.promoCode,
    required this.description,
    required this.validity,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Promo Code: $promoCode',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(description),
            SizedBox(height: 8.0),
            Text(
              validity,
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: onPressed,
              child: Text('Claim'),
            ),
          ],
        ),
      ),
    );
  }
}
