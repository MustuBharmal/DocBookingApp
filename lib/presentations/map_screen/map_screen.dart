import 'dart:async';

import 'package:doc_booking_app/presentations/specialist/controller/specialist_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
      zoom: 14,
    );
  }

  @override
  Widget build(BuildContext context) {
    return userLocation != null
        ? Obx(
            () => GoogleMap(
                mapType: MapType.normal,
                markers: SpecialistController.instance.markers.value,
                myLocationEnabled: true,
                myLocationButtonEnabled: false,
                // minMaxZoomPreference: MinMaxZoomPreference(10, 14),
                initialCameraPosition: userLocation!,
                onMapCreated: (GoogleMapController controller) {
                  mapController.complete(controller);
                }),
          )
        : Container();
  }
}
