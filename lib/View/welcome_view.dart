import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pantofitpremiumapp/View/home_view.dart';
import 'package:pantofitpremiumapp/View/login_view.dart';
class WelcomeView extends StatefulWidget {
  static String id = "welcome_view";
  @override
  _WelcomeViewState createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), ()=>Navigator.pushNamed(context, LoginView.id));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset('images/logo-outmarked.png',height: 100.0),
          SizedBox(height: 30.0,),
          Text('Bienvenue au PantoFit Premium'),


        ],
      ),
    );
  }
}

