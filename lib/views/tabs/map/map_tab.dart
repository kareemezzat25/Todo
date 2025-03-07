import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

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
              print(placemarks[0].country);
              print(placemarks[0].street);
              print(placemarks[0].postalCode);
            }
          },
          child: Icon(
            Icons.pin_drop,
            color: Colors.blue,
          )),
    );
  }
}
