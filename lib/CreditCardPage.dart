import 'package:flutter/material.dart';
import 'package:railrestro2/Location.dart ';
class CreditCardPage extends StatefulWidget {
  const CreditCardPage({super.key});

  @override
  State<CreditCardPage> createState() => _CreditCardPageState();
}

class _CreditCardPageState extends State<CreditCardPage> {
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController cardHolderController = TextEditingController();
  TextEditingController expirationController = TextEditingController();
  TextEditingController cvvController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DEBIT/CREDIT CARD', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.yellow.shade600,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: cardNumberController,
              decoration: InputDecoration(labelText: 'Card Number'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: cardHolderController,
              decoration: InputDecoration(labelText: 'Cardholder Name'),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: expirationController,
                    decoration: InputDecoration(labelText: 'Expiration Date'),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: TextField(
                    controller: cvvController,
                    decoration: InputDecoration(labelText: 'CVV'),
                  ),
                ),
              ],
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                // Validate and process payment information
                // You would typically integrate with a payment gateway here
                // For this example, let's just print the card information
                print('Card Number: ${cardNumberController.text}');
                print('Cardholder: ${cardHolderController.text}');
                print('Expiration: ${expirationController.text}');
                print('CVV: ${cvvController.text}');
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (BuildContext context) => LocationFetcherApp()));
              },
              child: Text('Make Payment'),
            ),
          ],
        ),
      ),
    );
  }
}