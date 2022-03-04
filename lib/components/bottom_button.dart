import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {

  BottomButton({required this.onTap, required this.buttonTitle});

  final Function() onTap;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child:  Text( buttonTitle,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        color: const Color(0xFFEB1555),
        margin: const EdgeInsets.only(top: 10),
        width: double.infinity,
        height: 80,
      ),
    );
  }
}