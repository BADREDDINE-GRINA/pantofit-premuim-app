import 'package:flutter/material.dart';
import 'package:pantofitpremiumapp/Constants/kPrimaryText.dart';
import 'package:pantofitpremiumapp/widgets/kOffresCard.dart';
import 'package:pantofitpremiumapp/widgets/kbuildCardSettings.dart';
class SettingsView extends StatefulWidget {
  static String id="settings_view";

  @override
  _SettingsViewState createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFF0E0F10),
      body: Center(
        child: Column(
          children: [
            Expanded(flex:2,child: SizedBox()),
            Text("PARAMETRES",style: kPrimaryBoldText,),
            Expanded(child: SizedBox(),flex: 1,),

            kbuildCardOffers(size, 'Solde', '7', 'Séances restantes', false),

            Padding(
              padding: EdgeInsets.only(left:size.width*0.075,right: size.width*0.075,top:10),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //first column -----------------------------------
                      Expanded(
                        child:Container(
                          decoration: BoxDecoration(
                            color: Color(0xFF19161c),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left:5.0,right: 5.0),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top:8.0,bottom: 8.0),
                                  child: Text('Dernières séances',style: TextStyle(color: Colors.white,fontSize: 16),),
                                ),
                                kbuildCardSettingsWithSubtitles(Icons.supervised_user_circle, 'ProGym', 'Il y a 3 jours'),
                                kbuildCardSettingsWithSubtitles(Icons.supervised_user_circle, 'Nausika', 'Il y a 3 jours'),
                                kbuildCardSettingsWithSubtitles(Icons.supervised_user_circle, 'AlphaForm', 'Il y a 3 jours'),
                              ],
                            ),
                          ),
                        )
                      ),
                      //second column ---------------------------
                      Expanded(child: Column(
                        children: [
                          kbuildCardSettings(Icons.calendar_today, 'Events'),
                          kbuildCardSettings(Icons.message, 'Contact'),
                          kbuildCardSettings(Icons.help, 'A Propos'),
                          kbuildCardSettings(Icons.music_note, 'Playlists'),



                        ],
                      )),
                    ],
                  ),


                  SizedBox(height: 10,),
                  kbuildCardSettings(Icons.keyboard_arrow_down, 'Aide et Assistance'),
                  kbuildCardSettings(Icons.keyboard_arrow_down, "Conditions d'utilisation"),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0,bottom:20.0),
                    child: kbuildLogOutButton(),
                  ),


                ],
              ),
            ),


          ],
        ),
      ),
    );
  }
}
