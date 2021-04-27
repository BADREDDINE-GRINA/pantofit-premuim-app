import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

class socialIcon extends StatelessWidget {
  final String iconSrc;
  final Function press;
  const socialIcon({
    Key key,
    this.iconSrc,
    this.press
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            border: Border.all(
              width: 2,
              color: Colors.white,
            ),
            shape: BoxShape.circle,
          ),
          child: SvgPicture.asset('images/icons/facebook.svg',height: 20.0,width: 20,)
      ),
    );
  }
}