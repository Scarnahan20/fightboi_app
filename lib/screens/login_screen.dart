import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../components/login_field.dart';
import '../components/rounded_button.dart';
import '../constants.dart';
import './registration_screen.dart';

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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Hero(
                tag: 'logo',
                child: Container(
                  child: Image(
                    image: AssetImage('assets/logo.png'),
                  ),
                ),
              ),
              Column(
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text(
                      'New to FIGHTBOI?',
                      style: kTitleStyle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  RoundedButton(
                    text: 'Register',
                    onPressed: () {
                      Navigator.pushNamed(context, RegistrationScreen.id);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
