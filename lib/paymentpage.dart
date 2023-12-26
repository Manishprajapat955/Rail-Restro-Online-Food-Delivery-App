import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:railrestro2/Location.dart';

import 'CreditCardPage.dart';
class paymentpage extends StatefulWidget {
  const paymentpage({super.key});

  @override
  State<paymentpage> createState() => _paymentpageState();
}

class _paymentpageState extends State<paymentpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PAYMENT OPTIONS', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.yellow.shade600,
      ),
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(

          children: <Widget>[

            SizedBox(height: 40),
            Container(
              decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.circular(30.0),
                  boxShadow: [BoxShadow(blurRadius: 2.0, color: Colors.yellow)]),
              width: 245.0,
              child: Align(
                alignment: Alignment.centerRight,
                child: MaterialButton(
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Icon(
                        Icons.local_atm,
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 25.0,
                      ),
                      Text(
                        'Cash On Delivery',
                        style: TextStyle(color: Colors.black, fontSize: 20.0),
                      ),
                    ],
                  ),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                     builder: (BuildContext context) => LocationFetcherApp()));
                 },
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.circular(30.0),
                  boxShadow: [BoxShadow(blurRadius: 2, color: Colors.yellow)]),
              width: 245.0,
              child: Align(
                alignment: Alignment.centerRight,
                child: MaterialButton(
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      //Icon(
                       // FontAwesomeIcons.amazonPay,
                        //color: Colors.black,
                     // ),
                      SizedBox(
                        width: 25.0,
                      ),
                      Text(
                        'Debit/Credit card',
                        style: TextStyle(color: Colors.black, fontSize: 20.0),
                      ),
                    ],
                  ),
                  onPressed: () {
                   Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (BuildContext context) => CreditCardPage()));
                  },
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
