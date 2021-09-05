import 'package:flutter/material.dart';

TextField kBuildTextFormField(String msg, Function onpress, bool hide) {
  return TextField(
    onChanged: onpress,
    obscureText: hide,
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
    child: TextFormField(
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