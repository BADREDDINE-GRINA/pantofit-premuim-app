import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pantofitpremiumapp/Constants/kPrimaryText.dart';

Container buildGymCard(Size size,String path,String name,String distance) {
  return Container(
    width: size.width*0.35,

    child: Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
          side: BorderSide(color: Color(0xFFc21e53),width: 1)
      ),
      elevation: 10,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 12,),
          SvgPicture.asset(path,height: size.width*0.17,),
          Expanded(child: SizedBox()),
          Divider(color: Color(0xFFc21e53),height: 1.5, thickness:1.5, indent: 30,
            endIndent: 30,),
          SizedBox(height: 7,),
          Text(name, style: kPrimaryBoldText,),
          Text(distance, style: kHolderText,),
          SizedBox(height: 12,),



        ],
      ),

    ),

  );
}