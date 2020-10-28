import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  static const String id = 'chat_screen';

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CHAT'),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Hero(
              tag: 'logo',
              child: Container(
                child: Image(
                  image: AssetImage('assets/logo.png'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
