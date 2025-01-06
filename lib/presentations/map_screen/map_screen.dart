import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen(this.lat, this.lng, this.markers, {super.key});

  final double lat;
  final double lng;
  final Rx<Set<Marker>> markers;

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final Completer<GoogleMapController> mapController = Completer<GoogleMapController>();
  CameraPosition? userLocation;

  double getZoomLevel(double radius) {
    double zoomLevel = 11;
    if (radius > 0) {
      double radiusElevated = radius + radius / 2;
      double scale = radiusElevated / 500;
      zoomLevel = 16 - math.log(scale) / math.log(2);
    }
    zoomLevel = double.parse(zoomLevel.toStringAsFixed(2));
    return zoomLevel;
  }

  @override
  void initState() {
    super.initState();
    userLocation = CameraPosition(
      target: LatLng(widget.lat, widget.lng),
      zoom: getZoomLevel(5000),
    );
  }

  @override
  Widget build(BuildContext context) {
    return userLocation != null
        ? Obx(
            () => GoogleMap(
                mapType: MapType.normal,
                markers: widget.markers.value,
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
