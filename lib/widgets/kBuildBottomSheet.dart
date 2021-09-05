import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pantofitpremiumapp/services/salle_service.dart';
import 'kBuildGymCard.dart';
Widget buildBottomSheet(BuildContext context){
  Size size = MediaQuery.of(context).size;

  return Container(
    height: size.height*0.33,
    padding: EdgeInsets.only(top: 7,bottom:7,left:15),
    decoration: BoxDecoration(
      color: Color.fromRGBO(34, 33, 34, 0.5),
      borderRadius: BorderRadius.only(topLeft: Radius.circular(40.0),topRight: Radius.circular(40.0)),
    ),
    child: Column(
      children: [
        Row(
          children: [
            Text('Salles à Proximité',style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),),
            Expanded(child: SizedBox()),
            MaterialButton(
                onPressed: null,
                child: GestureDetector(
                  onTap: (){Navigator.pop(context);},
                  child: Container(

                    child: Icon(Icons.keyboard_arrow_down,size:25,color: Color(0xFF16191C),),
                    height:25,
                    width: 25,
                    decoration:BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                      color: Color(0xFFD0D0D0),
                    ) ,
                  ),
                )
            ),

          ],
        ),
        Expanded(
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [

              buildGymCard(size, 'images/partenaires/progymm.svg', getSalleName(1), getSalleVille(1)),
              buildGymCard(size,'images/partenaires/nausika.svg',getSalleName(2),getSalleVille(2)),
              buildGymCard(size,'images/partenaires/alphaform.svg',getSalleName(3),getSalleVille(3)),

            ],
          ),
        )
      ],
    ),
  );
}

/*
FutureBuilder(
                future: getSalle(1),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  String a;
                  if(snapshot.data ==null){
                    a='Loading';
                  }
                  else{
                    a=snapshot.data;
                  }
                  print('snapshotData: ${snapshot.data}');
                  return buildGymCard(size, 'images/partenaires/progymm.svg', a??'saam', 'dead');
                },
              ),
 */