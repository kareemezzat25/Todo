import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:todo_app/views/tabs/map/location_service.dart';

class MapTab extends StatelessWidget {
  const MapTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            onPressed: () async {
              Position currentLocation =
                  await LocationService.determinePosition();

              List<Placemark> placemarks = await placemarkFromCoordinates(
                  currentLocation.latitude, currentLocation.longitude);
              if (placemarks.isNotEmpty) {
                print(currentLocation.latitude);
                print(currentLocation.longitude);
                print(placemarks[0].country);
                print(placemarks[0].postalCode);
                // 29.953551
                // 31.2138882
              }
            },
            child: Icon(
              Icons.pin_drop,
              color: Colors.blue,
            )),
        body: GoogleMap(
            key: UniqueKey(),
            mapType: MapType.normal,
            initialCameraPosition: CameraPosition(
                zoom: 16, target: LatLng(29.953551, 31.2138882))));
  }
}
