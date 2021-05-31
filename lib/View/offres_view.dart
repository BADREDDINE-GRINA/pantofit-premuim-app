import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pantofitpremiumapp/widgets/kListedesSallesWidget.dart';
import 'package:pantofitpremiumapp/widgets/kOffresCard.dart';

class OffresView extends StatefulWidget {
  static String id="offres_view";
  @override
  _OffresViewState createState() => _OffresViewState();
}

class _OffresViewState extends State<OffresView> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFF0e0f10),
      body: Column(
        children: [
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 40,bottom: 40),
              child: Image.asset('images/logo.png'),
              height: 80,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10,right:10),
            child: Center(child: Text("Ne payer que ce que vous allez consommer", textAlign:TextAlign.center, style: TextStyle(color: Colors.white,fontSize: 22,),)),
          ),
          Expanded(child: SizedBox(),flex: 1,),
          kbuildCardOffers(size,'LEGER','299 dh','20 séances',false),
          kbuildCardOffers(size,'STANDARD','549 dh','50 séances',true),
          kbuildCardOffers(size,'PRO','799 dh','100 séances',false),
          Expanded(child: SizedBox(),flex: 2,),
          kListedesSallesWidget(),
        ],
      ),
    );
  }
}
