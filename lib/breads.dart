import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:railrestro2/mycart.dart';
class breads extends StatefulWidget {


  @override
  State<breads> createState() => _breadsState();
  FirebaseFirestore firestore = FirebaseFirestore.instance;


}

class _breadsState extends State<breads> {
  List names=["TANDOORI ROTI","TANDOORI BUTTER ROTI","PLAIN NAAN","BUTTER NAAN","LACHA PARATA","ALOO PARATA","MASALA KULCHA","GARLIC NAAN","GOBI PARATA","RUMALI ROTI"];
  List prices=["\u{20B9}${15}","\u{20B9}${20}","\u{20B9}${25}","\u{20B9}${30}","\u{20B9}${60}","\u{20B9}${40}","\u{20B9}${60}","\u{20B9}${35}","\u{20B9}${40}","\u{20B9}${20}"];

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  List<Map<String, String>> cartItems = [];
  CollectionReference cartItemsCollection =
  FirebaseFirestore.instance.collection('cart_items');


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title:const Text('BREADS',style:TextStyle(color: Colors.black)),
          backgroundColor: Colors.yellow.shade600,
          actions: [IconButton( onPressed:(){Navigator.push(context, MaterialPageRoute(builder: (context)=> MyCartPage()));},icon: Icon(Icons.shopping_cart))],
        ),
      body: ListView.builder(
        itemCount: names.length,
        itemBuilder: (context, index) {
          final Bnames = names[index];
          final Bprices = prices[index];
          return ListTile(
            title: Text(Bnames),
            subtitle: Text(Bprices),
            trailing: ElevatedButton(
              onPressed: () async {
                await cartItemsCollection.add({
                  'name': Bnames,
                  'price': Bprices,
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Item added to cart'),
                  ),
                );
                setState(() {
                  cartItems.add({
                    'name': Bnames,
                    'price': Bprices,
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
