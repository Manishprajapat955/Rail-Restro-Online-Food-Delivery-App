import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:railrestro2/mycart.dart';
class riceandbiryani extends StatefulWidget {


  @override
  State<riceandbiryani> createState() => _riceandbiryaniState();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference cartItemsCollection =
  FirebaseFirestore.instance.collection('cart_items');
}

class _riceandbiryaniState extends State<riceandbiryani> {
  List names=["STEAM RICE","JEERA RICE","VED FRIED RICE","PANEER FRIED RICE","SEZWAN FRIED RICE","CURD RICE","VEG BIRYANI","HYDERABADI BIRYANI","KAJU BIRYANI","RAILRESTRO SPL BIRYANI"];
  List prices=["\u{20B9}${60}","\u{20B9}${100}","\u{20B9}${110}","\u{20B9}${130}","\u{20B9}${140}","\u{20B9}${100}","\u{20B9}${130}","\u{20B9}${140}","\u{20B9}${180}","\u{20B9}${220}"];

  List<Map<String, String>> cartItems = [];
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference cartItemsCollection =
  FirebaseFirestore.instance.collection('cart_items');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title:const Text('RICE AND BIRYANI',style:TextStyle(color: Colors.black)),
          backgroundColor: Colors.yellow.shade600,
          actions: [IconButton( onPressed:(){Navigator.push(context, MaterialPageRoute(builder: (context)=> MyCartPage()));},icon: Icon(Icons.shopping_cart))],
        ),
      body: ListView.builder(
        itemCount: names.length,
        itemBuilder: (context, index) {
          final Rname = names[index];
          final Rprices = prices[index];
          return ListTile(
            title: Text(Rname),
            subtitle: Text(Rprices),
            trailing: ElevatedButton(
              onPressed: () async {
                await cartItemsCollection.add({
                  'name': Rname,
                  'price': Rprices,
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
