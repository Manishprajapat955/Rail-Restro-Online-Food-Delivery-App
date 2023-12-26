import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';


import 'signin.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FutureBuilder(
        // Replace the future with your own initialization logic if needed
        future: Firebase.initializeApp(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return AnimatedSplashScreen(
              splash: Image.asset('assets/images/whiterestro.png'),
              splashIconSize: double.maxFinite,
              nextScreen: SIGNIN(),
              duration: 4000, // Adjust the duration as needed
            );
          }
          // You can show a loading indicator here if initialization is still in progress
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }
}





