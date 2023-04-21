import 'package:crudfire/firebase/auth/auth_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class signInView extends StatefulWidget {
  final AuthHelper authHelper;
  const signInView({Key? key, required this.authHelper}) : super(key: key);

  @override
  State<signInView> createState() => _signInViewState();
}

class _signInViewState extends State<signInView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text("Sign in"),
          backgroundColor: Color.fromARGB(255, 195, 132, 74),
        ),
        body: Padding(
            padding: const EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                  width: 50,
                  height: 170,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(100),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/akatsuki.jpeg'),
                          fit: BoxFit.cover)),
                ),
                 SizedBox(
                  height: 40,
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
                SizedBox(
                  height: 10,
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
                SizedBox(
                  height: 50,
                ),
                // TextButton(
                //   onPressed: () {
                //     //forgot password screen
                //   },
                //   child: const Text(
                //     'Forgot Password',
                //   ),
                // ),
                Container(
                    height: 50,
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: ElevatedButton(
                      child: isLoading?Text('Loading'):Text('Login'),
                      onPressed: () async {
                        setState(() {
                          isLoading = true;
                        });
                        bool isLoggedIn = await widget.authHelper.signin(
                            emailController.text, passwordController.text);
                        setState(() {
                          isLoading = false;
                        });
                        if (isLoggedIn) {
                          Navigator.pushReplacementNamed(context, "/home");
                        } else {}
                      },
                    )),
                Row(
                  children: <Widget>[
                    const Text('Does not have account?'),
                    TextButton(
                      child: const Text(
                        'Sign up',
                        style: TextStyle(fontSize: 17),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, "/signup");
                      },
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
              ],
            )));
  }
}
