import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../components/menu_button.dart';
import '../screens/news_screen.dart';
import '../screens/login_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'home_screen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  _checkLogin() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => SingleChildScrollView(
        child: Container(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: LoginScreen(),
        ),
      ),
    );
  }

  _launchURL() async {
    const url = 'http://fightboi.com';
    if (await canLaunch(url)) {
      await launch(
        url,
        forceWebView: true,
        enableJavaScript: true,
      );
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
      body: SafeArea(
        child: Container(
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
              MenuButton(
                text: 'NEWS',
                onPressed: _showNotifications,
              ),
              MenuButton(
                text: 'CHAT',
                onPressed: _checkLogin,
              ),
              MenuButton(
                text: 'SHOP',
                onPressed: _launchURL,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
