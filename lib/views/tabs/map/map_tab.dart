import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:todo_app/views/tabs/map/location_service.dart';

class MapTab extends StatefulWidget {
  MapTab({super.key});

  @override
  State<MapTab> createState() => _MapTabState();
}

class _MapTabState extends State<MapTab> {
  late GoogleMapController mapController;

  CameraPosition cameraPosition = CameraPosition(
      zoom: 16, target: LatLng(37.43296265331129, -122.08832357078792));

  late Set<Marker> markers = {
    Marker(markerId: MarkerId("1"), position: cameraPosition.target)
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              updateLocation();
            },
            child: Icon(
              Icons.pin_drop,
              color: Colors.white,
            )),
        body: GoogleMap(
            onMapCreated: (GoogleMapController controller) {
              mapController = controller;
            },
            markers: markers,
            mapType: MapType.normal,
            initialCameraPosition: cameraPosition));
  }

  void updateLocation() {
    Stream<Position> location = Geolocator.getPositionStream(
        locationSettings: LocationSettings(
            accuracy: LocationAccuracy.best, distanceFilter: 100));
    location.listen((Position currentPosition) {
      LatLng place =
          LatLng(currentPosition.latitude, currentPosition.longitude);
      mapController.animateCamera(CameraUpdate.newLatLngZoom(place, 18));
      markers.add(Marker(markerId: MarkerId("1"), position: place));
      setState(() {});
    });
  }
}
