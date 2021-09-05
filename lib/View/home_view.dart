import 'package:flutter/material.dart';
import 'package:pantofitpremiumapp/View/map_view.dart';
import 'package:pantofitpremiumapp/View/offres_view.dart';
import 'package:pantofitpremiumapp/View/profile_view.dart';
import 'package:pantofitpremiumapp/View/qrcode_view.dart';
import 'package:pantofitpremiumapp/View/settings_view.dart';

import 'login_view.dart';


class HomeView extends StatefulWidget {
  static String id = "home_view";
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    MapView(),
    OffresView(),
    QrCodeView(),
    ProfileView(),
    SettingsView(),
  ];
  void onTabTapped(int index) {

    setState(() {
      _currentIndex = index;

    });
  }
  @override
  void initState() {
    super.initState();
    if(LoginView.idClient==null){
      Navigator.pushNamed(context, LoginView.id);
    }
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: null,
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Color(0xFFc21e53),
        onTap: onTabTapped,
        elevation: 1.0,
        backgroundColor: Color(0xFF16191c),// new
        currentIndex: _currentIndex, // this will be set when a new tab is tapped
        items: [
          BottomNavigationBarItem(
              icon: new Icon(Icons.map),
              title: Text('Localisation')
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.payment),
            title: Text('Offres'),

          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings_overscan),
              title: Text('Qr-Code')
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text('Profil')
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              title: Text('Parametres')
          ),
        ],

      ),
      body:_children[_currentIndex],
    );
  }
}
