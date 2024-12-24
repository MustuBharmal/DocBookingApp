import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen(this.lat, this.lng, {super.key});

  final double lat;
  final double lng;

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final Completer<GoogleMapController> mapController = Completer<GoogleMapController>();
  CameraPosition? userLocation;

  @override
  void initState() {
    super.initState();
    userLocation = CameraPosition(
      target: LatLng(widget.lat, widget.lng),
      zoom: 14.4746,
    );
  }

  @override
  Widget build(BuildContext context) {
    return userLocation != null
        ? GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: userLocation!,
            onMapCreated: (GoogleMapController controller) {
              mapController.complete(controller);
            })
        : Container();
  }
}
