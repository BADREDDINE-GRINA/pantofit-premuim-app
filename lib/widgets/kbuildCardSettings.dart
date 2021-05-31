import 'package:flutter/material.dart';
import 'package:pantofitpremiumapp/Constants/kPrimaryText.dart';

Card kbuildCardSettings(IconData icondata,String title) {
  return Card(
    elevation: 1,
    color: Color(0xFF19161c),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(7),
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          leading: Icon(icondata),
          title: Text(title),
        ),
      ],
    ),
  );
}
Align kbuildLogOutButton() {
  return Align(
    alignment: Alignment.bottomRight,
    child: GestureDetector(
      child: Container(

        child:Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 20.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.logout),
              Text("Se Déconnecter",style: TextStyle(color: Colors.white,fontSize: 14,),),
            ],
          ),
        ),
        decoration: BoxDecoration(
          color: Color(0xFFc21e53),

          borderRadius: BorderRadius.circular(7),
        ),
      ),
    ),
  );
}

Card kbuildCardSettingsWithSubtitles(IconData icondata,String title,String subtitle) {
  return Card(
    elevation: 1,
    color: Color(0xFF23262B),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(7),
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          leading: Icon(icondata),
          title: Text(title),
          subtitle: Text(subtitle,style: TextStyle(fontSize: 14,color: Colors.grey),),
        ),
      ],
    ),
  );
}
