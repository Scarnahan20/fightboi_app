import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../constants.dart';
import '../components/login_field.dart';
import '../components/rounded_button.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String username;

  String password;

  final _auth = FirebaseAuth.instance;

  _launchURL() async {
    const url = 'http://fightboi.com';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Cannot launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              child: Image(
                image: AssetImage('assets/logo.png'),
              ),
            ),
            CarouselSlider(
              options: CarouselOptions(height: 200.0),
              items: [1, 2, 3].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(),
                      child: Image(
                        image: AssetImage('assets/$i.png'),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            MaterialButton(
              color: Colors.red[500],
              child: Text(
                'SHOP NOW',
                style: kShopButtonStyle,
              ),
              onPressed: _launchURL,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  LoginField(
                    hint: 'Username',
                    onChanged: (value) {},
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  LoginField(
                    hint: 'Password',
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  RoundedButton(
                    text: 'Login',
                    onPressed: () {},
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
