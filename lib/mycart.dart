import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:railrestro2/paymentpage.dart';

class MyCartPage extends StatefulWidget {
  @override
  _MyCartPageState createState() => _MyCartPageState();
}

class _MyCartPageState extends State<MyCartPage> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference cartItemsCollection =
  FirebaseFirestore.instance.collection('cart_items');
  List<Map<String, String>> cartItems = [];
  late Stream<QuerySnapshot> cartItemsStream;

  double totalAmount = 0.0;

  double calculateTotalAmount() {

    for (var cartItem in cartItems) {
      double price = double.tryParse(cartItem['price'] ?? '0.0') ?? 0.0;
      totalAmount += price;
    }
    return totalAmount;
  }

  Future<void> removeCartItem(String name) async {
    QuerySnapshot snapshot =
    await cartItemsCollection.where('name', isEqualTo: name).get();
    snapshot.docs.forEach((doc) async {
      await cartItemsCollection.doc(doc.id).delete();
      fetchCartItems();
    });
  }

  @override
  void initState() {
    super.initState();
    fetchCartItems();
  }

  Future<void> fetchCartItems() async {
    cartItemsStream = cartItemsCollection.snapshots();
    QuerySnapshot snapshot = await cartItemsCollection.get();
    print(snapshot);
    setState(() {
      cartItems = snapshot.docs.map((doc) {
        final name = doc['name'] as String?;
        final price = doc['price'] as String?;
        if (name != null && price != null) {
          return {'name': name, 'price': price};
        } else {
          return {'name': '', 'price': ''};
        }
      }).toList();
      print(cartItems);
      totalAmount = calculateTotalAmount();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MY CART', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.yellow.shade600,
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: cartItemsStream,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator(); // Show a loading indicator while fetching data
                }
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }
                // Extract document snapshots from the query snapshot
                List<QueryDocumentSnapshot> documents = snapshot.data!.docs;

                return ListView.builder(
                  itemCount: documents.length,
                  itemBuilder: (context, index) {
                    final cartItem = documents[index].data() as Map<String, dynamic>;
                    final name = cartItem['name'] as String?;
                    final price = cartItem['price'] as String?;

                    return ListTile(
                      title: Text(name ?? ''),
                      subtitle: Text(price ?? ''),
                      trailing: ElevatedButton(
                        onPressed: () {
                          removeCartItem(name ?? '');
                        },
                        child: Text('Remove'),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Container(
                  child: Text(
                    'Total Amount: \u{20B9}${totalAmount.toStringAsFixed(2)}',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),

                ),
                ElevatedButton(onPressed: (){
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (BuildContext context) => paymentpage()));
                }, child: Text("payment"),)
              ],
            ),

          ),
        ],
      ),
    );
  }
}
