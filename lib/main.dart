import 'package:fightboi_app/login_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'constants.dart';
import 'rounded_button.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
    return MaterialApp(
      title: 'FIGHTBOI',
      theme: ThemeData.dark(),
      home: Scaffold(
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
                    LoginField('Username'),
                    SizedBox(
                      height: 10.0,
                    ),
                    LoginField('Password'),
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
      ),
    );
  }
}
