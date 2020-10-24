import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../components/login_field.dart';
import '../components/rounded_button.dart';

class LoginScreen extends StatefulWidget {
  static const String id = "login_screen";

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String username;
  String password;

  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LOGIN'),
      ),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              LoginField(
                hint: 'Username',
                onChanged: (value) {
                  setState(() {
                    username = value;
                  });
                },
                isPassword: false,
              ),
              SizedBox(
                height: 10.0,
              ),
              LoginField(
                hint: 'Password',
                onChanged: (value) {
                  setState(() {
                    password = value;
                  });
                },
                isPassword: true,
              ),
              SizedBox(
                height: 10.0,
              ),
              RoundedButton(
                text: 'Login',
                onPressed: () async {
                  try {
                    final user = _auth.signInWithEmailAndPassword(
                        email: username, password: password);
                    if (user != null) {
                      Navigator.pop(context);
                    }
                  } catch (e) {
                    print(e);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
