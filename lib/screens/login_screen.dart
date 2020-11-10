import 'package:fightboi_app/screens/chat_screen.dart';
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
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'LOGIN',
            style: kTitleStyle,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 10.0,
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
                isActive: true,
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
                isActive: false,
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
                      Navigator.pushNamed(context, ChatScreen.id);
                    }
                  } catch (e) {
                    print(e);
                  }
                },
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                'OR',
                style: kTitleStyle,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 10.0,
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
    );
  }
}
