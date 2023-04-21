import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class homePage_view extends StatefulWidget {
  const homePage_view({super.key});

  @override
  State<homePage_view> createState() => _homePage_viewState();
}

class _homePage_viewState extends State<homePage_view> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("HomePage"),),
      body: TextButton(onPressed: () {
        Navigator.pushReplacementNamed(context, "/signin");
        
      }, child: Text("Log Out"),),
    );
  }
}