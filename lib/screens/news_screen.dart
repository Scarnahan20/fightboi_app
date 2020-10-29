import 'package:flutter/material.dart';

import '../constants.dart';

class NewsScreen extends StatelessWidget {
  static const String id = 'news_screen';

  final announcements = {
    'Hero - 10/29/20':
        'So long Hero animations, we hardly knew ye. As it turned out having the FIGHTBOI logo on screen all the time with no exceptions is a bit silly and does not really have any place in this app. Also I need a way to format the date in the announcement title, it\'s a little too big.  I think an average announcement might be something like this long.',
    'Updates - 10/28/20': 'Check out these Hero animations.',
    'Also - 10/23/20':
        'I have made another announcement to test something. This is a lengthy-ass announcement in order to stretch the page a bit so I can test scrolling.',
    'First - 10/23/20': 'I hereby create this announcement page.',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.symmetric(
          vertical: 20.0,
          horizontal: 10.0,
        ),
        color: Colors.white,
        child: Column(
          children: [
            Text(
              'NEWS',
              style: kTitleStyle,
            ),
            SizedBox(
              height: 10.0,
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: announcements.length,
                itemBuilder: (BuildContext context, int index) {
                  String title = announcements.keys.elementAt(index);
                  String text = announcements.values.elementAt(index);
                  return Column(
                    children: <Widget>[
                      ListTile(
                        title: Text(title, style: kNewsTitleStyle),
                        subtitle: Text(text, style: kNewsMainStyle),
                      ),
                      Divider(
                        color: Colors.black,
                        height: 10.0,
                      )
                    ],
                  );
                },
              ),
            ),
            Text(
              '...',
              style: kNewsTitleStyle,
            ),
          ],
        ),
      ),
    );
  }
}
