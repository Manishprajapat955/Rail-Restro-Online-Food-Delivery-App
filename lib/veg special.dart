import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:railrestro2/mycart.dart';
class vegspecial extends StatefulWidget {


  @override
  State<vegspecial> createState() => _vegspecialState();

}

class _vegspecialState extends State<vegspecial> {
  List names=["MIX VEGETABLE","KADAI VEG","VEG JAIPURI","VEG CHATPATA","HARA BHARA MASALA","BABY CORN MASALA","PANJABI CHANA MASALA","MUSHROOM MASALA",];
  List prices=["\u{20B9}${140}","\u{20B9}${150}","\u{20B9}${150}","\u{20B9}${160}","\u{20B9}${160}","\u{20B9}${180}","\u{20B9}${140}","\u{20B9}${200}",];

  List<Map<String, String>> cartItems = [];
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference cartItemsCollection =
  FirebaseFirestore.instance.collection('cart_items');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title:const Text('VEG SPECIAL',style:TextStyle(color: Colors.black)),
          backgroundColor: Colors.yellow.shade600,
          actions: [IconButton( onPressed:(){Navigator.push(context, MaterialPageRoute(builder: (context)=> MyCartPage()));},icon: Icon(Icons.shopping_cart))],
        ),
      body: ListView.builder(
        itemCount: names.length,
        itemBuilder: (context, index) {
          final Vnames = names[index];
          final Vprices = prices[index];
          return ListTile(
            title: Text(Vnames),
            subtitle: Text(Vprices),
            trailing: ElevatedButton(
              onPressed: () async {
                await cartItemsCollection.add({
                  'name': Vnames,
                  'price': Vnames,
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
