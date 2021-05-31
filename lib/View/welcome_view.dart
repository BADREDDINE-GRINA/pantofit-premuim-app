import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pantofitpremiumapp/View/home_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pantofitpremiumapp/View/login_view.dart';
import 'package:pantofitpremiumapp/View/test_view.dart';
class WelcomeView extends StatefulWidget {
  static String id = "welcome_view";
  @override
  _WelcomeViewState createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), ()=>Navigator.pushNamed(context, TestView.id));
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFF16191c),
      body: Center(
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(child: SizedBox()),
            Container(
              height: size.height*0.4,
              child: Hero(tag:'logo',child: Image.asset('images/outlined-logo.png')),
            ),
            Text('Bienvenue au PantoFit Premium',style: TextStyle(color: Colors.white,fontSize: 17),),
            Expanded(child: SizedBox()),
            Padding(
              padding: const EdgeInsets.only(bottom:8.0),
              child: Text("Version Beta",style: TextStyle(color: Colors.grey,fontSize: 16)),
            )


          ],
        ),
      ),
    );
  }
}

