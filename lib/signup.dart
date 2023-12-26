import 'package:flutter/material.dart';
import 'signin.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
class SIGNUP extends StatefulWidget {


  @override
  State<SIGNUP> createState() => _SIGNUPState();
}

class _SIGNUPState extends State<SIGNUP> {
  TextEditingController name=TextEditingController();
  TextEditingController phoneNo=TextEditingController();
  TextEditingController _email=TextEditingController();
  TextEditingController _password=TextEditingController();
  void initState(){
    Firebase.initializeApp();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('RAIL RESTRO',style:TextStyle(color: Colors.black)),
        backgroundColor: Colors.yellow.shade600,),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(child:Image.asset('assets/images/whiterestro.png',height:200,fit: BoxFit.cover,)),

            TextField(controller: name,decoration: InputDecoration(hintText: "ENTER YOUR NAME",border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20.0)))),),
            TextField(controller: phoneNo,decoration: InputDecoration(hintText: "ENTER YOUR PHONE NUMER",border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20.0)))),),
            TextField(controller:_email,decoration:InputDecoration(hintText: "ENTER YOUR EMAIL", filled: true,border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20.0)))),),
            TextField(controller:_password,decoration: InputDecoration(hintText: "ENTER YOUR PASSWORD", filled: true,border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20.0)))),obscureText: true,),
            ElevatedButton(onPressed: (){
              FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email.text, password: _password.text).then((value){
                print("CREATED A NEW ACCOUNT");
                Navigator.push(context, MaterialPageRoute(builder: (context)=>SIGNIN()));
              }).onError((error, stackTrace) {
                print(error);
              });
              Navigator.push(context, MaterialPageRoute(builder: (context)=>SIGNIN()));
            }, child: Text("SIGN UP")),
            Text("ALREADY HAVE AN ACCOUNT ?"),
            ElevatedButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SIGNIN()));
            }, child: Text('SINGIN')),
          ],
        ),
      ),
    );
  }
}
