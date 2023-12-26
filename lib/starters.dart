import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:railrestro2/mycart.dart';

class StartersPage extends StatefulWidget {
  @override
  _StartersPageState createState() => _StartersPageState();
}

class _StartersPageState extends State<StartersPage> {
  List<Map<String, String>> cartItems = [];
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference cartItemsCollection =
  FirebaseFirestore.instance.collection('cart_items');
  List<String> startersList = [
    "FRENCH FRIES",
    "VEG MANCHURIA",
    "VEG 65",
    "PANEER MANCHURIA",
    "PANEER 777",
    "PANEER 65",
    "PANEER TIKKA",
    "GOBI MANCHURIA",
    "GOBI 65",
    "ALLO TIKKA"
  ];
  List<String> startersPrices = [
    "\u{20B9}100",
    "\u{20B9}120",
    "\u{20B9}120",
    "\u{20B9}150",
    "\u{20B9}180",
    "\u{20B9}140",
    "\u{20B9}200",
    "\u{20B9}130",
    "\u{20B9}120",
    "\u{20B9}150"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('STARTERS', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.yellow.shade600,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyCartPage()),
              );
            },
            icon: Icon(Icons.shopping_cart),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: startersList.length,
        itemBuilder: (context, index) {
          final starterName = startersList[index];
          final starterPrice = startersPrices[index];
          return ListTile(
            title: Text(starterName),
            subtitle: Text(starterPrice),
            trailing: ElevatedButton(
              onPressed: () async {
                await cartItemsCollection.add({
                  'name': starterName,
                  'price': starterPrice,
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Item added to cart'),
                  ),
                );
                setState(() {
                  cartItems.add({
                    'name': starterName,
                    'price': starterPrice,
                  });
                });
              },
              child: Text('Add to Cart'),
            ),
          );
        },
      ),
    );
  }
}




