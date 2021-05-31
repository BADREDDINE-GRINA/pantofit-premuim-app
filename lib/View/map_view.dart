import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pantofitpremiumapp/Constants/Utils.dart';
import 'package:pantofitpremiumapp/widgets/kBuildBottomSheet.dart';


class MapView extends StatefulWidget {
  static String id="map_view";
  @override
  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {

  Set<Marker> _markers = {};
  Uint8List markerIcon;
  @override
  void initState() {
    super.initState();
    setCustomMarker();
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
  static final CameraPosition _kGym = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(34.023387055271584, -6.015746911903754),
      tilt: 59.440717697143555,
      zoom: 20.151926040649414
  );

  /*Future<void> _goToAGym() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kGym));
  }
*/
  void _onMapCreated(GoogleMapController controller){
    controller.setMapStyle(Utils.mapStyle);
    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId('Pro Gym'),
          icon: BitmapDescriptor.fromBytes(markerIcon),
          position:LatLng(33.71115830916527, -7.345940790768825),
          infoWindow: InfoWindow(
              title: 'Pro Gym',
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
            initialCameraPosition: CameraPosition(
                target: LatLng(33.699505817254334, -7.396500489329218),
                zoom: 6.5
            ),
              onMapCreated: _onMapCreated,
              markers: _markers,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 70),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(208,208,208,0.3),
                        borderRadius: BorderRadius.circular(10)
                      ),

                        padding: EdgeInsets.symmetric(horizontal: 24,vertical: 7),
                        child: Column(
                          children: [
                            Text('15',style: TextStyle(color:Colors.white,fontSize: 17,fontWeight: FontWeight.bold),),
                            Text('Séances Restantes',style: TextStyle(color:Colors.white)),
                          ],
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

