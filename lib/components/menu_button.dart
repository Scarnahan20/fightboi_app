import 'package:flutter/material.dart';

import '../constants.dart';

class MenuButton extends StatelessWidget {
  final Function onPressed;
  final String text;

  MenuButton({this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Colors.red[500],
      child: Text(
        text,
        style: kShopButtonStyle,
      ),
      onPressed: onPressed,
    );
  }
}
