import 'package:flutter/material.dart';
import 'package:pantofitpremiumapp/Constants/kPrimaryText.dart';
import 'package:pantofitpremiumapp/View/login_view.dart';
import 'package:pantofitpremiumapp/services/offres_service.dart';

Card kbuildCardOffers(Size size,String type,Future<int> montant,Future<int> nbrticket,bool activated) {
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
                FutureBuilder(
                  future: montant,
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    String mnt;
                    if(snapshot.data ==null){
                      mnt='Loading';
                    }
                    else{
                      mnt=snapshot.data.toString();
                    }
                    print('snapshotData: ${snapshot.data}');
                    return RichText(
                      text:TextSpan(
                        text:mnt,
                        style: TextStyle(color: Colors.white,fontSize: 28,fontWeight: FontWeight.bold),
                          children: const <TextSpan>[
                            TextSpan(
                              text: ' dh',
                              style: TextStyle(color: Color(0xFFbaaaaa),fontSize: 20),
                            )
                          ]
                      ),


                    );
                    },
              ),
                Padding(
                  padding: const EdgeInsets.only(bottom:8.0),
                  child: FutureBuilder(
                    future: nbrticket,
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      String nbrticket;
                      if(snapshot.data ==null){
                        nbrticket='Loading';
                      }
                      else{
                        nbrticket=snapshot.data.toString();
                      }
                      print('snapshotData: ${snapshot.data}');
                      return Text('$nbrticket séances', style: TextStyle(color: Colors.grey,fontSize: 18),);
                    },
                  )
                )
              ],
            ),
          ),

        ],
      ),
    ),
  );
}



Card kbuildCardOffers2(Size size,Future<int> solde) {
  return Card(
    elevation: 1.0,
    color: Color(0xFF19161c),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(7),

    ),
    child: Container(

      width: size.width*0.85,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left:7.0,top: 7.0),
            child: Text('Solde',style: TextStyle(color:Colors.grey,fontSize: 14),),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom:12.0),
              child: FutureBuilder(
                future: solde,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  String soldeactuel;
                  if(snapshot.data ==null){
                    soldeactuel='Loading';
                  }
                  else{
                    soldeactuel=snapshot.data.toString();
                  }
                  print('snapshotData: ${snapshot.data}');
                  return RichText(
                    text:TextSpan(
                        text:soldeactuel,
                        style: TextStyle(color: Colors.white,fontSize: 28,fontWeight: FontWeight.bold),
                        children: const <TextSpan>[
                          TextSpan(
                            text: ' séances',
                            style: TextStyle(color: Colors.grey,fontSize: 18,fontWeight: FontWeight.normal),
                          )
                        ]
                    ),


                  );
                },
              ),
            ),
          ),

        ],
      ),
    ),
  );
}

