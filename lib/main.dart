import 'package:crudfire/screens/decider_view.dart';
import 'package:crudfire/screens/homePage.dart';
import 'package:crudfire/screens/signin_screen.dart';
import 'package:crudfire/screens/signup_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase/auth/auth_helper.dart';
import 'firebase_options.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );  
  final auth = FirebaseAuth.instance;
  final authHelper = AuthHelper(auth);
  runApp(MyApp(authHelper: authHelper,));
}

class MyApp extends StatelessWidget {
  final AuthHelper authHelper;
  const MyApp({super.key,required this.authHelper});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/':(context)=>DeciderView(authHelper: authHelper,),
        '/signin':(context)=>signInView(authHelper: authHelper,),
        '/home':(context)=>homePage_view(),
        '/signup':(context)=>signUpView(authHelper: authHelper,),
      },
    );
  }
}


