import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:projectnew/login.sol.dart';
import 'package:projectnew/register.sol.dart';
import 'package:projectnew/welcome_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'home.sol.dart';
import 'firebase_options.dart';
import 'package:firebase_app_check/firebase_app_check.dart';



void main()
async{
 WidgetsFlutterBinding.ensureInitialized();

 await Firebase.initializeApp(
   options: DefaultFirebaseOptions.currentPlatform,
 );
 FirebaseFirestore.instance.settings = const Settings(
   persistenceEnabled: true,
 );


 runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomView(),
      routes:
      {
        'welcome': (context) =>WelcomView(),
        'register': (context) => MyRegister(),
        'login': (context) => MyLogin(),
        'home': (context) => HomeView(),

      },


    );
  }
}
