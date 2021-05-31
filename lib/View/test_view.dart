import 'package:flutter/material.dart';
import 'package:pantofitpremiumapp/Constants/kInputText.dart';
import 'package:pantofitpremiumapp/Constants/kPrimaryText.dart';
import 'package:pantofitpremiumapp/View/login_view.dart';

class TestView extends StatelessWidget {
  static String id = "test_view";
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String code;
    return Scaffold(
      backgroundColor: Color(0xFF16191c),
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(flex:3,child: SizedBox()),
            Container(
              height: size.height*0.2,
              child: Hero(tag:'logo',child: Image.asset('images/logo.png')),
            ),
            Text("Cette version est reservée aux administrateurs de PantoFit. Pour y accéder veuillez saisir le code d'accés !",textAlign:TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 17),),
            Padding(
              padding: const EdgeInsets.only(left: 35.0,right: 35.0,top: 15.0),
              child: TextField(
                onChanged:(value) {code= value;},
                keyboardType: TextInputType.visiblePassword,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: "Code d'accés",

                  contentPadding:
                  EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                    BorderSide(color: Color(0xFFc21e53), width: 3.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                    BorderSide(color: Color(0xFFc21e53), width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                color: Color(0xFFc21e53),
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                elevation: 5.0,
                child: MaterialButton(
                  onPressed: ()  {
                   if(code=='cv'){
                     Navigator.pushNamed(context, LoginView.id);
                   }
                   else{
                     AlertDialog(title: Text("Le code d'accés que vous avez saisi est incorrect. Nous vous prions de quitter l'application si vous ne faites pas partie de l'équipe pantofit"),);

                   }
                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child: Text(
                    "Valider le code", style: kPrimaryBoldText,
                  ),
                ),
              ),
            ),
            Expanded(flex:2,child: SizedBox()),
            Padding(
              padding: const EdgeInsets.only(bottom:8.0),
              child: Text("La version officielle sera disponible avant le 20 juin 2021",style: TextStyle(color: Colors.grey,fontSize: 16),textAlign:TextAlign.center,),

            ),



          ],
        ),
      ),
    );
  }
}
