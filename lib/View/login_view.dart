import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pantofitpremiumapp/Constants/OrDivider.dart';
import 'package:pantofitpremiumapp/View/home_view.dart';
import '../services/auth-service.dart';
import 'package:pantofitpremiumapp/Constants/kInputText.dart';
import 'package:pantofitpremiumapp/Constants/kPrimaryText.dart';

import 'package:pantofitpremiumapp/Constants/socialIcon.dart';
import 'package:pantofitpremiumapp/View/registration_view.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:http/http.dart';

class LoginView extends StatefulWidget {
  static String id = "login_view";
  static int idClient;
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  String email;
  String password;
  bool spinnerCall=false;
  bool errorMessage=false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFF16191c),
      body: ModalProgressHUD(
        inAsyncCall: spinnerCall,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(
                  height: size.height*0.15,
                ),
                Hero(
                  tag: 'logo',
                  child: Container(
                    height: size.height*0.2,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
                SizedBox(
                  height: 48.0,
                ),
                kBuildTextFormField('Adresse Mail',(value) {email= value;}, false),
                SizedBox(
                  height: 8.0,
                ),

                kBuildTextFormField('Mot de Passe', (value) {password= value;}, true),
                SizedBox(
                  height: 10.0,
                ),
                errorMessage==true?Text("L'adresse mail ou le mot de passe saisi est incorrect",style: TextStyle(color: Colors.red),):Text(""),

                SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Material(
                    color: Color(0xFFc21e53),
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    elevation: 5.0,
                    child: MaterialButton(
                      onPressed: ()  async{
                        setState(() {
                          spinnerCall=true;
                        });
                        try{
                          final userlog= await postLogin(email, password);
                          if (userlog ==200) {
                            print('Status is 200');
                            Navigator.pushNamed(context, HomeView.id);
                          }
                          setState(() {
                            spinnerCall=false;
                          });
                        }
                        catch (e) {
                          print(e);
                          setState((){
                            spinnerCall=false;
                            errorMessage=true;
                          });
                        }
                      },
                      minWidth: 200.0,
                      height: 42.0,
                      child: Text(
                        "S'identifier", style: kPrimaryBoldText,
                      ),
                    ),
                  ),
                ),
                FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Vous n'avez pas de compte?",style: kPrimaryText,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      GestureDetector(
                        onTap: (){ Navigator.pushNamed(context, RegistrationView.id);},
                        child: Text(
                          "Registrez-vous",style: kPrimaryBoldText,
                        ),
                      )
                    ],
                  ),
                ),
                OrDivider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    socialIcon(iconSrc: 'images/icons/facebook.svg',press: (){}),
                    socialIcon(iconSrc: 'images/icons/google.svg',press: (){}),
                    socialIcon(iconSrc: 'images/icons/linkedin.svg',press: (){}),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );;
  }

}
