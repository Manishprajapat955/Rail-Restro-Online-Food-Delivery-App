import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:railrestro2/mycart.dart';
class colddrinks extends StatefulWidget {

  @override
  State<colddrinks> createState() => _colddrinksState();

}
class _colddrinksState extends State<colddrinks> {
  List names=["STRAWBERRY CHEESECAKE","PINEAPPLE CAKE","CHOCOLATE ICECREAM","BUTTERSCOTCH ICECREAM","MINERAL WATER","COKE 330ML","SPRITE 330ML","THUMBSUP 330ML ",];
  List prices=["\u{20B9}${80}","\u{20B9}${70}","\u{20B9}${60}","\u{20B9}${50}","\u{20B9}${20}","\u{20B9}${60}","\u{20B9}${45}","\u{20B9}${45}",];
  List<Map<String, String>> cartItems = [];
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference cartItemsCollection =
  FirebaseFirestore.instance.collection('cart_items');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title:const Text('COLD DRINKS',style:TextStyle(color: Colors.black)),
          backgroundColor: Colors.yellow.shade600,
          actions: [IconButton( onPressed:(){Navigator.push(context, MaterialPageRoute(builder: (context)=> MyCartPage()));},icon: Icon(Icons.shopping_cart))],
        ),
      body: ListView.builder(
        itemCount: names.length,
        itemBuilder: (context, index) {
          final Cnames = names[index];
          final Cprices = prices[index];
          return ListTile(
            title: Text(Cnames),
            subtitle: Text(Cprices),
            trailing: ElevatedButton(
              onPressed: () async {
                await cartItemsCollection.add({
                  'name': Cnames,
                  'price': Cprices,
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