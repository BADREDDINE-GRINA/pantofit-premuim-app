import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pantofitpremiumapp/Constants/kPrimaryText.dart';
import 'package:pantofitpremiumapp/services/salle_service.dart';

Container buildGymCard(Size size,String path,Future<String> name,Future<String> ville) {
  print('We are inside the gymcard');
  return Container(
    width: size.width*0.35,


    child: GestureDetector(
      onTap: (){

      },
      child: Card(

        color: Color(0xFF19161c),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
            side: BorderSide(color: Color(0xFFc21e53),width: 1)
        ),
        elevation: 10,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 10,),
            Expanded(child: SvgPicture.asset(path)),
            SizedBox(height: 10,),
            Divider(color: Color(0xFFc21e53),height: 1.5, thickness:1.5, indent: 30,
              endIndent: 30,),
            SizedBox(height: 7,),
            FutureBuilder(
              future: name,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                String a;
                if(snapshot.data ==null){
                  a='Loading';
                }
                else{
                  a=snapshot.data;
                }
                print('snapshotData: ${snapshot.data}');
                return Text(a, style: kPrimaryBoldText,);
              },
            ),
            FutureBuilder(
              future: ville,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                String a;
                if(snapshot.data ==null){
                  a='Loading';
                }
                else{
                  a=snapshot.data;
                }
                print('snapshotData: ${snapshot.data}');
                return Text(a, style: kHolderText,);
              },
            ),

            SizedBox(height: 10,),



          ],
        ),

      ),
    ),

  );
}