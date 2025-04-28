import 'package:flutter/material.dart';
import 'package:flutter_app/constants/colors.dart';

const TextStyle descriptionStyle = TextStyle(
  fontSize: 12,
  color: textlight,
  fontWeight: FontWeight.w200,
);

const inputTextDecoration = InputDecoration(
  hintText: "email",
  hintStyle: TextStyle(color: textlight, fontSize: 15),
  fillColor: bgblck,
  filled: true,
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: mainYellow, width: 1),
    borderRadius: BorderRadius.all(Radius.circular(100)),
  ),

  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: mainYellow, width: 1),
    borderRadius: BorderRadius.all(Radius.circular(100)),
  ),
);
