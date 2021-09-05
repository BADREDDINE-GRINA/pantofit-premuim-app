import 'package:flutter/material.dart';
import 'package:pantofitpremiumapp/Constants/OrDivider.dart';
import 'package:pantofitpremiumapp/View/offres_view.dart';
import '../services/auth-service.dart';
import 'package:pantofitpremiumapp/Constants/kInputText.dart';
import 'package:pantofitpremiumapp/Constants/kPrimaryText.dart';
import 'package:pantofitpremiumapp/Constants/socialIcon.dart';
import 'package:pantofitpremiumapp/View/home_view.dart';
import 'package:pantofitpremiumapp/View/login_view.dart';
import 'package:http/http.dart';
import 'package:email_validator/email_validator.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class RegistrationView extends StatefulWidget {
  static String id = "registration_view";
  @override
  _RegistrationViewState createState() => _RegistrationViewState();
}

class _RegistrationViewState extends State<RegistrationView> {
  String email;
  String nom;
  String prenom;
  String password;
  String confirmPassword;
  bool errorMessage=false;
  bool errorPasswordMessage=false;

  bool spinnerCall=false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
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
                    kBuildSemiTextField('Nom',(value) {nom= value;}, TextInputType.visiblePassword),
                    SizedBox(width: 7,),
                    kBuildSemiTextField('Prénom',(value) {prenom= value;}, TextInputType.visiblePassword),

                  ],
                ),
                SizedBox(
                  height: 8.0,
                ),
                kBuildTextFormField('Adresse Mail', (value) {email= value;}, false),
                SizedBox(
                  height: 8.0,
                ),
                kBuildTextFormField('Mot de Passe',(value) {password= value;}, true),
                SizedBox(
                  height: 8.0,
                ),
                kBuildTextFormField('confirmation de mot de passe', (value) {confirmPassword= value;}, true),
                SizedBox(
                  height: 10.0,
                ),
                errorMessage==true?Text("Le format de l'adresse mail est incorrect",style: TextStyle(color: Colors.red),):Text(""),
                errorPasswordMessage==true?Text("Mots de passe ne correspondent pas",style: TextStyle(color: Colors.red),):Text(""),



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
                          if(EmailValidator.validate(email)==true) {
                            print('email validate');
                            if(password==confirmPassword){
                              print('password validate');
                              final userlog= await postRegistration(email, password);
                              print('userlog:$userlog');
                              userlog==200?Navigator.pushNamed(context, HomeView.id):Navigator.pushNamed(context, OffresView.id);

                            }
                            else{
                              setState(() {
                                errorPasswordMessage=true;
                              });
                            }

                          }
                          else{
                            print('email not validated');
                            setState(() {
                              errorMessage=true;
                            });

                          }

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
      ),
      );
  }

}
