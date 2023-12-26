import 'package:flutter/material.dart';
import 'homepage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:railrestro2/signup.dart';

class SIGNIN extends StatefulWidget {
  @override
  State<SIGNIN> createState() => _SIGNINState();
}

class _SIGNINState extends State<SIGNIN> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool _isButtonDisabled = false;

  @override
  void initState() {
    Firebase.initializeApp();
    super.initState();
  }

  bool _validateInputs() {
    if (_email.text.isEmpty || _password.text.isEmpty) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RAIL RESTRO', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.yellow.shade600,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Image.asset(
                'assets/images/whiterestro.png',
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 50,),
            TextField(
              controller: _email,
              decoration: const InputDecoration(
                hintText: "ENTER YOUR EMAIL",
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
              ),
            ),
            TextField(
              controller: _password,
              decoration: const InputDecoration(
                hintText: "ENTER YOUR PASSWORD",
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
              ),
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: _isButtonDisabled
                  ? null
                  : () {
                if (_validateInputs()) {
                  setState(() {
                    _isButtonDisabled = true;
                  });

                  FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                    email: _email.text,
                    password: _password.text,
                  )
                      .then((value) {
                    print("SIGNED IN SUCCESS");
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HOMEPAGE(),
                      ),
                    );
                  }).catchError((error) {
                    print(error);
                    setState(() {
                      _isButtonDisabled = false;
                    });
                  });
                }
              },
              child: const Text("SIGN IN"),
            ),
            const Text("DON'T HAVE AN ACCOUNT ?"),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => SIGNUP()),
                );
              },
              child: Text('SIGNUP'),
            ),
          ],
        ),
      ),
    );
  }
}

