import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../constants.dart';
import '../screens/news_screen.dart';
import '../screens/login_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'home_screen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  _checkLogin() async {
    Navigator.pushNamed(context, LoginScreen.id);
  }

  _launchURL() async {
    const url = 'http://fightboi.com';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Cannot launch $url';
    }
  }

  _showNotifications() async {
    await Navigator.pushNamed(context, NewsScreen.id);
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
            Hero(
              tag: 'logo',
              child: Container(
                child: Image(
                  image: AssetImage('assets/logo.png'),
                ),
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
                'NEWS',
                style: kShopButtonStyle,
              ),
              onPressed: _showNotifications,
            ),
            MaterialButton(
              color: Colors.red[500],
              child: Text(
                'SHOP',
                style: kShopButtonStyle,
              ),
              onPressed: _launchURL,
            ),
            MaterialButton(
              color: Colors.red[500],
              child: Text(
                'CHAT',
                style: kShopButtonStyle,
              ),
              onPressed: _checkLogin,
            ),
          ],
        ),
      ),
    );
  }
}
