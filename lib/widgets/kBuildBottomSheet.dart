import 'package:flutter/material.dart';
import 'kBuildGymCard.dart';
Widget buildBottomSheet(BuildContext context){
  Size size = MediaQuery.of(context).size;
  return Container(
    height: size.height*0.33,
    padding: EdgeInsets.symmetric(vertical: 15,horizontal: 30),
    decoration: BoxDecoration(
      color: Color.fromRGBO(22, 25, 28, 0.5),
      borderRadius: BorderRadius.only(topLeft: Radius.circular(40.0),topRight: Radius.circular(40.0)),
    ),
    child: Column(
      children: [
        Row(
          children: [
            Text('Salles à Proximité',style:TextStyle(color: Colors.white),),
            Expanded(child: SizedBox()),
            MaterialButton(
                onPressed: null,
                child: Container(

                  child: Icon(Icons.keyboard_arrow_down,size:25,color: Color(0xFF16191C),),
                  height:25,
                  width: 25,
                  decoration:BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                    color: Color(0xFFD0D0D0),
                  ) ,
                )
            ),

          ],
        ),
        Expanded(
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              buildGymCard(size,'images/partenaires/alphaform.svg','AlphaForm','à 400m'),
              buildGymCard(size,'images/partenaires/progym.svg','AlphaForm','à 400m'),
              buildGymCard(size,'images/partenaires/alphaform.svg','AlphaForm','à 400m'),

            ],
          ),
        )
      ],
    ),
  );
}