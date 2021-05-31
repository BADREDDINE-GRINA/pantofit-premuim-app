import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pantofitpremiumapp/widgets/kListedesSallesWidget.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrCodeView extends StatefulWidget {
  static String id="qrcode_view";
  @override
  _QrCodeViewState createState() => _QrCodeViewState();
}

class _QrCodeViewState extends State<QrCodeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0e0f10),
      body: Column(
        children: [
          Center(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 50,horizontal: 0),
              child: Image.asset('images/logo.png'),
              height: 75,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 6,left:20,right: 20),
            child: Text("Scannez ce Qr-code à l'entrée de chaque salle",textAlign: TextAlign.center, style: TextStyle(color: Colors.white,fontSize: 18),),
          ),
          Container(
              width: 70,
              child: Divider(
                color: Colors.white,
                thickness: 1.0,

              )),
          Expanded(flex:1,child: SizedBox()),
          Center(
            child: Container(
              padding: EdgeInsets.all(10),
              
              decoration: BoxDecoration(
                color: Color(0xFF16191c),
                borderRadius: BorderRadius.all(Radius.circular(10))
              ),
              child: QrImage(
                data: "1234567890",
                version: QrVersions.auto,
                size: 250.0,
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                embeddedImage: AssetImage('images/logo-qr.png'),
                embeddedImageStyle: QrEmbeddedImageStyle(
                  size: Size(60, 60),
                ),
                errorStateBuilder: (cxt, err) {
                  return Container(
                    child: Center(
                      child: Text(
                        "Une erreur est s'ervenue, Veuillez nous appeler sur le numéro suivant 0700907802 ou réssayer ultérieurement",
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                },
              ),

            ),
          ),
          Expanded(flex:2,child: SizedBox()),
          Center(
            child: Container(
              decoration: BoxDecoration(
                  color: Color.fromRGBO(208,208,208,0.3),
                  borderRadius: BorderRadius.circular(10)
              ),

              padding: EdgeInsets.symmetric(horizontal: 24,vertical: 7),
              child: Column(
                children: [
                  Text('15',style: TextStyle(color:Colors.white,fontSize: 17,fontWeight: FontWeight.bold),),
                  Text('Séances Restantes',style: TextStyle(color:Colors.white)),
                ],
              ),
            ),
          ),
          Expanded(child: SizedBox()),

          kListedesSallesWidget()



        ],
      ),
    );
  }
}
