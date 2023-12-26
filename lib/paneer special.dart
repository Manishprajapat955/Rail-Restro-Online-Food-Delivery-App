import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:railrestro2/mycart.dart';
class paneer extends StatefulWidget {
 

  @override
  State<paneer> createState() => _paneerState();

}

class _paneerState extends State<paneer> {
  List names=["ALOO PANEER","CHANA PANEER","MUTTER PANEER","PANEER BUTTER MASALA","KADAI PANEER","PANEER DOPYAZA","SAHI PANEER","PALAK PANEER","KAJU PANEER","PANEER TIKKA MASALA"];
  List prices=["\u{20B9}${120}","\u{20B9}${130}","\u{20B9}${140}","\u{20B9}${150}","\u{20B9}${150}","\u{20B9}${140}","\u{20B9}${160}","\u{20B9}${150}","\u{20B9}${170}","\u{20B9}${200}"];

  List<Map<String, String>> cartItems = [];
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference cartItemsCollection =
  FirebaseFirestore.instance.collection('cart_items');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title:const Text('PANEER SPECIAL ',style:TextStyle(color: Colors.black)),
          backgroundColor: Colors.yellow.shade600,
          actions: [IconButton( onPressed:(){Navigator.push(context, MaterialPageRoute(builder: (context)=> MyCartPage()));},icon: Icon(Icons.shopping_cart))],
        ),
        body: ListView.builder(
      itemCount: names.length,
      itemBuilder: (context, index) {
        final paneerName = names[index];
        final paneerPrice = prices[index];
        return ListTile(
          title: Text(paneerName),
          subtitle: Text(paneerPrice),
          trailing: ElevatedButton(
            onPressed: () async {
              await cartItemsCollection.add({
                'name': paneerName,
                'price': paneerPrice,
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
