import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:pantofitpremiumapp/Constants/Utils.dart';
import 'package:pantofitpremiumapp/services/location_service.dart';
import 'package:pantofitpremiumapp/services/salle_service.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pantofitpremiumapp/widgets/kBuildBottomSheet.dart';

import 'login_view.dart';




class MapView extends StatefulWidget {
  static String id="map_view";

  @override
  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  Set<Marker> _markers = {};
  Uint8List markerIcon;
  GoogleMapController _controller;
  Completer<GoogleMapController> _completer = Completer();

  @override
  void initState() {
    super.initState();
    getBytesFromAsset('images/maps.png', 100);
    setCustomMarker();
    if(LoginView.idClient==null){
      Navigator.pushNamed(context, LoginView.id);
    }

  }

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(), targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png)).buffer.asUint8List();
  }

  void setCustomMarker() async{
    markerIcon = await getBytesFromAsset('images/maps.png', 100);

  }



  void _onMapCreated(GoogleMapController controller){
    _controller=controller;
    _controller.setMapStyle(Utils.mapStyle);
    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId('Pro Gym'),
          icon: BitmapDescriptor.fromBytes(markerIcon),
          position:LatLng(33.71115830916527, -7.345940790768825),
          infoWindow: InfoWindow(
              title:'pro Gym',
              snippet: '5500m 3etage avec accées piscine et coahing personnalisé'
          ),

        ),
      );
      _markers.add(
        Marker(
          markerId: MarkerId('Alpha Form'),
          icon: BitmapDescriptor.fromBytes(markerIcon),
          position:LatLng(31.653649371343874, -8.050956094758602),
          infoWindow: InfoWindow(
              title: 'Alpha Form',
              snippet: '5500m 3etage avec accées piscine et coahing personnalisé'
          ),
        ),
      );
      _markers.add(
        Marker(
          markerId: MarkerId('Nausika Fitness'),
          position:LatLng(34.023387055271584, -5.015746911903754),
          icon: BitmapDescriptor.fromBytes(markerIcon),
          infoWindow: InfoWindow(
              title: 'Nausika Fitness',
              snippet: '5500m 3etage avec accées piscine et coahing personnalisé'
          ),
        ),
      );
    });

  }




  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [

          GoogleMap(
            myLocationEnabled: true,
            mapToolbarEnabled: false,
            myLocationButtonEnabled: true,
            initialCameraPosition: CameraPosition(
                target: LatLng(33.699505817254334, -7.396500489329218),
                zoom: 6.5
            ),
              onMapCreated: _onMapCreated,
              markers: _markers,

          ),
          Padding(
            padding: const EdgeInsets.only(top:12.0,left: 12.0),
            child: Hero(
              tag: 'logo',
              child: Align(
                alignment: Alignment.topLeft,
                child: SvgPicture.asset('images/logo.svg',height: size.height*0.07,),
              ),
            ),
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 70),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: (){},
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(208,208,208,0.3),
                          borderRadius: BorderRadius.circular(10)
                        ),

                          padding: EdgeInsets.symmetric(horizontal: 24,vertical: 7),
                          child: Column(
                            children: [
                              Text('3',style: TextStyle(color:Colors.white,fontSize: 17,fontWeight: FontWeight.bold),),
                              Text('Salles Partenaires',style: TextStyle(color:Colors.white)),
                            ],
                          ),
                      ),
                    ),
                    Expanded(child: SizedBox()),
                    GestureDetector(
                      onTap: (){showModalBottomSheet(context: context, builder: (context) {return buildBottomSheet(context);});},
                      child: Container(
                        height: 50,
                        width: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color.fromRGBO(208, 208, 208, 1)
                          ),
                        child: Icon(Icons.keyboard_arrow_up,size: 50,color: Color(0xFF16191c),),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20,)
            ],

          ),

        ],
      ),
    );

             
    
  }
}

/*

  Future<void> animateTo(double lat, double lng) async {
    final c = await _controller.future;
    final p = CameraPosition(target: LatLng(lat, lng), zoom: 40);
    c.animateCamera(CameraUpdate.newCameraPosition(p));
  }

*/