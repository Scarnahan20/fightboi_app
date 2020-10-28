import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../components/login_field.dart';
import '../components/rounded_button.dart';
import '../constants.dart';
import './chat_screen.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = "registration_screen";

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
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
                  Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text(
                      'Register now to gain access to the chat!',
                      style: kTitleStyle,
                      textAlign: TextAlign.center,
                    ),
                  ),
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
                    text: 'Register',
                    onPressed: () async {
                      try {
                        final user = _auth.signInWithEmailAndPassword(
                            email: username, password: password);
                        if (user != null) {
                          Navigator.pushNamed(context, ChatScreen.id);
                        }
                      } catch (e) {
                        print(e);
                      }
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
