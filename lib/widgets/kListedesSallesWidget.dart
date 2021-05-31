import 'package:flutter/material.dart';
import 'package:pantofitpremiumapp/Constants/kPrimaryText.dart';

class kListedesSallesWidget extends StatelessWidget {
  const kListedesSallesWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
          children: [
            Expanded(child: SizedBox()),
            Icon(Icons.brightness_auto),
            SizedBox(width:20),
            Text('Liste des Salles',style: kPrimaryText,),
            Expanded(child: SizedBox()),
          ],
        ),
      ),
      decoration: BoxDecoration(
        color: Color(0xFF19161c),
        borderRadius:BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),

      ),
    );
  }
}
