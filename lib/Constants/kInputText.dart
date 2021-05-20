import 'package:flutter/material.dart';

TextField kBuildTextField(String msg, Function onpress, TextInputType typeText) {
  return TextField(
    onChanged: onpress,
    keyboardType: typeText,
    textAlign: TextAlign.center,
    decoration: InputDecoration(
      hintText: msg,

      contentPadding:
      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(32.0)),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide:
        BorderSide(color: Color(0xFF1D1E33), width: 1.0),
        borderRadius: BorderRadius.all(Radius.circular(32.0)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide:
        BorderSide(color: Color(0xFF1D1E33), width: 2.0),
        borderRadius: BorderRadius.all(Radius.circular(32.0)),
      ),
    ),
  );
}

Widget kBuildSemiTextField(String msg, Function onpress, TextInputType typeText) {
  return Expanded(
    child: TextField(
      onChanged: onpress,
      keyboardType: typeText,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        hintText: msg,

        contentPadding:
        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide:
          BorderSide(color: Color(0xFF1D1E33), width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:
          BorderSide(color: Color(0xFF1D1E33), width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
      ),
    ),
  );
}