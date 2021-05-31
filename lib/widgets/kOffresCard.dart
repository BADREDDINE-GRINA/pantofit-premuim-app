import 'package:flutter/material.dart';

Card kbuildCardOffers(Size size,String type,String price,String seances,bool activated) {
  return Card(
    elevation: 1.0,
    color: Color(0xFF19161c),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(7),
        side: activated==true? BorderSide(color: Color(0xFFc21e53),width: 2):BorderSide(width:0),

    ),
    child: Container(

      width: size.width*0.85,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left:7.0,top: 7.0),
            child: Text(type,style: TextStyle(color:Colors.grey,fontSize: 14),),
          ),
          Center(
            child: Column(
              children: [
                Text(price,style: TextStyle(color: Colors.white,fontSize: 28,fontWeight: FontWeight.bold),),
                Padding(
                  padding: const EdgeInsets.only(bottom:8.0),
                  child: Text(seances,style: TextStyle(color: Colors.grey,fontSize: 18),),
                )
              ],
            ),
          ),

        ],
      ),
    ),
  );
}