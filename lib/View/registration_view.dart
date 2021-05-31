import 'package:flutter/material.dart';
import 'package:pantofitpremiumapp/Constants/OrDivider.dart';
import 'package:pantofitpremiumapp/Constants/kInputText.dart';
import 'package:pantofitpremiumapp/Constants/kPrimaryText.dart';
import 'package:pantofitpremiumapp/Constants/socialIcon.dart';
import 'package:pantofitpremiumapp/View/home_view.dart';
import 'package:pantofitpremiumapp/View/login_view.dart';

class RegistrationView extends StatefulWidget {
  static String id = "registration_view";
  @override
  _RegistrationViewState createState() => _RegistrationViewState();
}

class _RegistrationViewState extends State<RegistrationView> {
  String email;
  String nom;
  String Prenom;

  String password;
  String ConfirmPassword;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFF0E0F10),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: size.height*0.10,
              ),
              Container(
                height: size.height*0.10,
                child: Hero(tag:'logo',child: Image.asset('images/logo.png')),
              ),
              SizedBox(
                height: size.height*0.10,
              ),
              //Expanded(flex:1,child: Container(),),
              Row(
                children: [
                  kBuildSemiTextField('Nom',(value) {email= value;}, TextInputType.visiblePassword),
                  SizedBox(width: 7,),
                  kBuildSemiTextField('Prénom',(value) {email= value;}, TextInputType.visiblePassword),

                ],
              ),
              SizedBox(
                height: 8.0,
              ),
              kBuildTextField('Adresse Mail',(value) {email= value;}, TextInputType.emailAddress),
              SizedBox(
                height: 8.0,
              ),
              kBuildTextField('Mot de Passe',(value) {email= value;}, TextInputType.visiblePassword),
              SizedBox(
                height: 8.0,
              ),
              kBuildTextField('Confirmation de Mot de Passe',(value) {email= value;}, TextInputType.visiblePassword),



              SizedBox(
                height: 24.0,
              ),

              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Material(
                  color: Color(0xFFc21e53),
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  elevation: 5.0,
                  child: MaterialButton(
                    onPressed: ()  {
                      //TODO: login
                      Navigator.pushNamed(context, HomeView.id);
                    },
                    minWidth: 200.0,
                    height: 42.0,
                    child: Text(
                      "Se Registrer", style: kPrimaryBoldText,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Vous avez déja un compte?",style: kPrimaryText,
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  GestureDetector(
                    onTap: (){ Navigator.pushNamed(context, LoginView.id);},
                    child: Text(
                      "Identifiez-vous",style: kPrimaryBoldText,
                    ),
                  )
                ],
              ),
              OrDivider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  socialIcon(iconSrc: 'images/icons/facebook.svg',press: (){}),
                  socialIcon(iconSrc: 'images/icons/google.svg',press: (){}),
                  socialIcon(iconSrc: 'images/icons/linkedin.svg',press: (){}),
                ],
              ),
            ],
          ),
        ),
      ),
      );
  }

}
