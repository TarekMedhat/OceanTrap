import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  final LatLng protoTypeLatLng;

  const MapScreen({Key key, this.protoTypeLatLng}) : super(key: key);
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  Completer<GoogleMapController> _controller = Completer();
  static final CameraPosition _initialCamera = CameraPosition(
    target: LatLng(0, 0),
    zoom: 4,
  );

  GoogleMap googleMap;

  CameraPosition _kGooglePlex;

    CameraPosition _kLake;

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }

  Set markers = [
    Marker(
      infoWindow: InfoWindow(title: "Prototype001",snippet: "Empty"),
        markerId: MarkerId('1'),
        position: LatLng(26.4679011, -140.5077093),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue)),
    Marker(
        infoWindow: InfoWindow(title: "Prototype002",snippet: "Full"),
        markerId: MarkerId('2'),
        position: LatLng(31.9783886, -133.9622316),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed)),
    Marker(
        infoWindow: InfoWindow(title: "Prototype004",snippet: "Collecting"),
        markerId: MarkerId('4'),
        position: LatLng(28.1028001, -131.3196995),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen))
  ].toSet();

  MapType mapType = MapType.satellite;

  @override
  void initState() {
    super.initState();
    _kLake = CameraPosition(
    bearing: 192.8334901395799,
    target: widget.protoTypeLatLng?? LatLng(31.9783886,-133.9622316),
    tilt: 59.440717697143555,
    zoom: 8.151926040649414);
    _kGooglePlex  = CameraPosition(
      target: widget.protoTypeLatLng?? LatLng(37.42796133580664, -122.085749655962),
      zoom: 4.4746,
    );
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("Ocean Trap Map"),
      ),
      body: Stack(
        children: <Widget>[
          GoogleMap(

            myLocationEnabled: true,
            mapToolbarEnabled: true,
            compassEnabled: true,
            zoomGesturesEnabled: true,
            markers: markers,
            myLocationButtonEnabled: true,
            mapType: mapType,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          ),
          Positioned(
            left: 12,
            bottom: 12,
            child: Container(

              padding: EdgeInsets.all(6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(180),
                boxShadow: [BoxShadow(blurRadius: 8,color: Colors.black26)],
                color: Colors.white,

              ),
              child: IconButton(
                icon: Icon(Icons.satellite,size: 30,), onPressed: () {
                  setState(() {
                    if(mapType==MapType.satellite) {
                      mapType = MapType.normal;
                    }
                    else {
                      mapType = MapType.satellite;
                    }
                  });

              },
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: Text('To the device!'),
        icon: Icon(Icons.directions_boat),
      ),
    );
  }
}
