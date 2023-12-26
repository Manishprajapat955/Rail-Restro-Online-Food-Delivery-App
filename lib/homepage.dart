import 'package:flutter/material.dart';
import 'package:railrestro2/mycart.dart';
import 'package:railrestro2/paneer special.dart';
import 'package:railrestro2/starters.dart';
import 'package:railrestro2/veg special.dart';
import 'package:railrestro2/breads.dart';
import 'package:railrestro2/rice and biryani.dart';
import 'package:railrestro2/cold drinks.dart';

class HOMEPAGE extends StatefulWidget {
  const HOMEPAGE({super.key});

  @override
  State<HOMEPAGE> createState() => _HOMEPAGEState();
}

class _HOMEPAGEState extends State<HOMEPAGE> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title:const Text('RAIL RESTRO',style:TextStyle(color: Colors.black)),
          backgroundColor: Colors.yellow.shade600,
          actions: [IconButton( onPressed:(){Navigator.push(context, MaterialPageRoute(builder: (context)=> MyCartPage()));},icon: Icon(Icons.shopping_cart))],
        ),

      body: Center(
        child:SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(

            child:TextField(decoration:InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20.0)))
                ,prefixIcon:Icon(Icons.search,),
              suffixIcon: Icon(Icons.sort),
              hintText: "What Would You Like To Oder"
            ))),

            Text("TODAYS SPECIAL",style:TextStyle(fontSize:30)),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children:[ TextButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> StartersPage()));},
                    child:Column(children: [ Container(
                      margin: EdgeInsets.only(right:11), height:120, width: 120,
                      child: Image.asset('assets/images/gobi.jpg',height: 100,),
                    ),
                    ],)),
                  TextButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> paneer()));},
                      child:Column(children: [ Container(
                        margin: EdgeInsets.only(right:11), height:120, width: 120,
                        child: Image.asset('assets/images/download.jpg',height: 100,),
                      ),
                      ],)),
                  TextButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> vegspecial()));},
                      child:Column(children: [ Container(
                        margin: EdgeInsets.only(right:11), height:120, width: 120,
                        child: Image.asset('assets/images/mix veg curry.jpg',height: 100,),
                      ),
                      ],)),
                  TextButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> breads()));},
                      child:Column(children: [ Container(
                        margin: EdgeInsets.only(right:11), height:120, width: 120,
                        child: Image.asset('assets/images/alupatara.jpg',height: 100,),
                      ),
                      ],)),
                  TextButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> riceandbiryani()));},
                      child:Column(children: [ Container(
                        margin: EdgeInsets.only(right:11), height:120, width: 120,
                        child: Image.asset('assets/images/biryani.jpg',height: 100,),
                      ),
                      ],)),
                  TextButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> colddrinks()));},
                      child:Column(children: [ Container(
                        margin: EdgeInsets.only(right:11), height:120, width: 120,
                        child: Image.asset('assets/images/cake.jpg',height: 100,),
                      ),
                      ],)),
                ]
              ),
            ),


            Text("MENU CATEGORIES",style: TextStyle(fontSize: 30),),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                  children:[  TextButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> StartersPage()));},
                      child:Column(children: [ Container(
                        margin: EdgeInsets.only(right:11), height:170, width: 170,
                        child: Image.asset('assets/images/STARTERS.png',height: 100,),
                      ),
                        Text("STARTERS",style: TextStyle(fontSize: 15,color:Colors.black)),
                      ],)),
                    TextButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> paneer()));},
                        child:Column(children: [ Container(
                          margin: EdgeInsets.only(right:11), height:170, width: 170,
                          child: Image.asset('assets/images/paneer special.png',height: 100,),
                        ),
                          Text("PANEER SPECIAL",style: TextStyle(fontSize: 15,color:Colors.black)),
                        ],)),

                   ]
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                  children:[  TextButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> vegspecial()));},
                      child:Column(children: [ Container(
                        margin: EdgeInsets.only(right:11), height:170, width: 170,
                        child: Image.asset('assets/images/veg special.png',height: 100,),
                      ),
                        Text("VEG SPECIAL",style: TextStyle(fontSize: 15,color:Colors.black)),
                      ],)),
                    TextButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> breads()));},
                        child:Column(children: [ Container(
                          margin: EdgeInsets.only(right:11), height:170, width: 170,
                          child: Image.asset('assets/images/breads.png',height: 100,),
                        ),
                          Text("BREADS",style: TextStyle(fontSize: 15,color:Colors.black)),
                        ],)),

                  ]
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                  children:[  TextButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> riceandbiryani()));},
                      child:Column(children: [ Container(
                        margin: EdgeInsets.only(right:11), height:170, width: 170,
                        child: Image.asset('assets/images/Rice and biryani.png',height: 100,),
                      ),
                        Text("RICE AND BIRYANI",style: TextStyle(fontSize: 15,color:Colors.black)),
                      ],)),
                    TextButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> colddrinks()));},
                        child:Column(children: [ Container(
                          margin: EdgeInsets.only(right:11), height:170, width: 170,
                          child: Image.asset('assets/images/drinks.png',height: 100,),
                        ),Text("DESERTS AND BEVERAGES",style: TextStyle(fontSize: 15,color:Colors.black)),

                        ],)),
                  ]
              ),
            ),
                   TextButton(onPressed: (){
             },
                      child:Column(children: [ Container(
                      margin: EdgeInsets.only(right:11), height:150, width: 150,
                      child: Image.asset('assets/images/whiterestro.png',height: 100,),
                      ),
                      ],
                      )
                   ),
          ],
        ),
        ),
    ));
  }
}

