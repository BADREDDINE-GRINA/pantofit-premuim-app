import 'package:flutter/material.dart';
import 'package:pantofitpremiumapp/View/home_view.dart';
import 'package:pantofitpremiumapp/View/login_view.dart';
import 'package:pantofitpremiumapp/View/welcome_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PantoFit Premium',
      home: MainPage(),
    );
  }
}
class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData.dark().copyWith(
        textTheme: TextTheme(
          body1: TextStyle(color: Colors.black54),
        ),
      ),
      initialRoute: WelcomeView.id,
      routes: {
        WelcomeView.id: (context) => WelcomeView(),
        HomeView.id: (context) => HomeView(),
        LoginView.id: (context) => LoginView(),
      },

    );;
  }
}
