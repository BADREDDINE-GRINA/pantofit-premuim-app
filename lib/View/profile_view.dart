import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:pantofitpremiumapp/services/qr_service.dart';
import 'package:pantofitpremiumapp/services/user_service.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileView extends StatefulWidget {
  static String id="profile_view";
  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  String qrCode = '';
  @override

  void initState() {
    super.initState();
    scanQRCode();
    postNombreSeancesRestantes();
  }


  Future<void> scanQRCode() async {
    try {
      final qrCode = await FlutterBarcodeScanner.scanBarcode(
        '#c21e53',
        'Annuler',
        true,
        ScanMode.QR,
      );
      if (!mounted) return;
      setState(() {
        this.qrCode = qrCode;
        postValidationScan(qrCode);
      });
    }
    on PlatformException {
      qrCode = null;
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:  Center(

        ),
    );
  }
}





class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;

  const ButtonWidget({
    @required this.text,
    @required this.onClicked,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => RaisedButton(
    child: Column(
      children: [
        SizedBox(
          height: 100,
          child: Container(
            color:Colors.white,
          ),
        ),
        Text(
          text,
          style: TextStyle(fontSize: 24),
        ),
      ],
    ),
    shape: StadiumBorder(),
    color: Theme.of(context).primaryColor,
    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    textColor: Colors.white,
    onPressed: onClicked,
  );
}