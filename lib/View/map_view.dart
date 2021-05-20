import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pantofitpremiumapp/Constants/Utils.dart';
import 'package:flutter_svg/flutter_svg.dart';


class MapView extends StatefulWidget {
  static String id="map_view";
  @override
  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  Set<Marker> _markers = {};
  BitmapDescriptor mapMarker;
  @override
  void initState() {
    super.initState();
    setCustomMarker();
  }

  void setCustomMarker() async{
    mapMarker = await BitmapDescriptor.fromAssetImage(ImageConfiguration(size: Size(60, 40)), 'images/maps-and-flags.png');
  }

  void _onMapCreated(GoogleMapController controller){
    controller.setMapStyle(Utils.mapStyle);
    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId('Pro Gym'),
          icon: mapMarker,
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
          icon: mapMarker,
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
          icon: mapMarker,
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

          GoogleMap(initialCameraPosition: CameraPosition(
                target: LatLng(33.699505817254334, -7.396500489329218),
                zoom: 6.5
            ),
              onMapCreated: _onMapCreated,
              markers: _markers,
          ),
          MaterialButton(
            onPressed: (){},
            //put this material button at the buttom
            child: Text("size"),
          )
        ],
      ),
    );

             
    
  }
}

