import 'package:crudfire/screens/signin_screen.dart';
import 'package:crudfire/screens/signin_screen.dart';
import 'package:crudfire/screens/signup_screen.dart';
import 'package:crudfire/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../firebase/auth/auth_helper.dart';
import 'homePage.dart';

class DeciderView extends StatefulWidget {
  final AuthHelper authHelper;
  const DeciderView({super.key,required this.authHelper});

  @override
  State<DeciderView> createState() => _DeciderViewState();
}

class _DeciderViewState extends State<DeciderView> {
  bool isLoggedIn = false;
  @override
    void initState() {
      isLoggedIn = widget.authHelper.verifyUser();
      super.initState();
    }
  @override
  Widget build(BuildContext context) {
    return isLoggedIn ? homePage_view() :signUpView(authHelper: widget.authHelper,);
  }
}