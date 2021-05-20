import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:pantofitpremiumapp/Constants/kBuildGymCard.dart';



class ProfileView extends StatefulWidget {
  static String id="profile_view";

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title:Text('Modal')
      ),
      body:Column(
        children: [
          Text('dze'),
          MaterialButton(
            child: Text('salam'),
              onPressed: (){
                showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Container(
                        height: size.height*0.33,
                        padding: EdgeInsets.symmetric(vertical: 15,horizontal: 30),
                        decoration: BoxDecoration(
                          color: Color(0xFF16191C),
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(40.0),topRight: Radius.circular(40.0)),
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text('Salles à Proximité',),
                                Expanded(child: SizedBox()),
                                MaterialButton(
                                    onPressed: null,
                                    child: Container(

                                      child: Icon(Icons.arrow_downward_sharp,color: Color(0xFF16191C),),
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
                );
              }
          ),
        ],

        ),
      );
  }
}
