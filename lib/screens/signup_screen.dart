import 'package:crudfire/firebase/auth/auth_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class signUpView extends StatefulWidget {
  final AuthHelper authHelper;
  const signUpView({Key? key, required this.authHelper}) : super(key: key);

  @override
  State<signUpView> createState() => _signUpViewState();
}

class _signUpViewState extends State<signUpView> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text("Sign up"),
          backgroundColor: Color.fromARGB(255, 195, 132, 74),
        ),
        body: Padding(
            padding: const EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                  width: 50,
                  height: 150,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(100),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/Madarahashi.jpeg'),
                          fit: BoxFit.cover)),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: usernameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Username',
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    //forgot password screen
                  },
                  child: const Text(
                    'Forgot Password',
                  ),
                ),
                Container(
                    height: 50,
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: ElevatedButton(
                      child: const Text('Create Account'),
                      onPressed: () async {
                        bool isLoggedIn = await widget.authHelper.signup(
                            usernameController.text,
                            emailController.text,
                            passwordController.text);
                        print(isLoggedIn);
                        if (isLoggedIn) {
                          Navigator.pushReplacementNamed(context, '/home');
                        } else {}
                      },
                    )),
                Row(
                  children: <Widget>[
                    const Text('Already have a account?'),
                    TextButton(
                      child: const Text(
                        'Sign in',
                        style: TextStyle(fontSize: 17),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, "/signin");
                      },
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
              ],
            )));
  }
}
