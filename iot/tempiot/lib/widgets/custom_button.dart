import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65.0,
      margin: EdgeInsets.symmetric(
        horizontal: 24.0,
        vertical: 8.0,
      ),
      decoration: BoxDecoration(
        color: Colors.black,
        border: Border.all(color: Colors.black, width: 2.0),
        borderRadius: BorderRadius.circular(12.0),
      ),
    );
  }
}
