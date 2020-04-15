
import 'package:flutter/material.dart';

class FlashButton extends StatelessWidget {
  const FlashButton({
    Key key,
    this.buttonText,
    this.buttonColor,
    this.callback
  }) : super(key: key);

  final String buttonText;
  final Color buttonColor;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        color: buttonColor,
        borderRadius: BorderRadius.circular(30.0),
        elevation: 5.0,
        child: MaterialButton(
          onPressed: callback,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            buttonText,
          ),
        ),
      ),
    );
  }
}