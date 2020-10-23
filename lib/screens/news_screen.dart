import 'package:flutter/material.dart';

import '../components/rounded_button.dart';
import '../screens/home_screen.dart';
import '../constants.dart';

class NewsScreen extends StatelessWidget {
  static const String id = 'news_screen';

  final announcements = {
    'Also (10/23/20)': 'I have made another announcement to test something.',
    'First (10/23/20)': 'I hereby create this announcement page.',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NEWS'),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: announcements.length,
              itemBuilder: (BuildContext context, int index) {
                String title = announcements.keys.elementAt(index);
                String text = announcements.values.elementAt(index);
                return Column(
                  children: <Widget>[
                    ListTile(
                      title: Text(title, style: kTitleStyle),
                      subtitle: Text(text, style: kRegularStyle),
                    ),
                    Divider(
                      height: 10.0,
                    )
                  ],
                );
              },
            ),
            RoundedButton(
              text: 'ENTER',
              onPressed: () {
                Navigator.pushNamed(context, HomeScreen.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
