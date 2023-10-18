import 'package:flutter/material.dart';
import 'package:timed_rally_app/shared/constants.dart';

const textInputDecoration = InputDecoration(
  labelStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.w300),
  focusedBorder: OutlineInputBorder(
    borderRadius: const BorderRadius.all(Radius.circular(20.0)),
    borderSide: BorderSide(color: Color(0xFF8D8D8D), width: 2),
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: const BorderRadius.all(Radius.circular(20.0)),
    borderSide: BorderSide(color: Color(0xFF8D8D8D), width: 2),
  ),
  errorBorder: OutlineInputBorder(
    borderRadius: const BorderRadius.all(Radius.circular(20.0)),
    borderSide: BorderSide(color: Color(0xFF8D8D8D), width: 2),
  ),
);

const textLabelFormStyle = TextStyle(
    color: Color(0xFF8D8D8D), fontWeight: FontWeight.w500, fontSize: 18);

void nextScreen(context, page) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => page));
}

void nextScreenReplace(context, page) {
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => page));
}
