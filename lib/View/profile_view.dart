
import 'dart:ffi';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pantofitpremiumapp/Constants/Utils.dart';
import 'package:pantofitpremiumapp/widgets/kBuildBottomSheet.dart';




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
          body: buildLogOutButton(),
        );
      }

      Align buildLogOutButton() {
        return Align(
          alignment: Alignment.bottomRight,
          child: GestureDetector(
            child: Container(

              child:Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 20.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.logout),
                    Text("Se Déconnecter",style: TextStyle(color: Colors.white,fontSize: 14,),),
                  ],
                ),
              ),
              decoration: BoxDecoration(
                color: Color(0xFFc21e53),

                borderRadius: BorderRadius.circular(7),
              ),
            ),
          ),
        );
      }
    }




