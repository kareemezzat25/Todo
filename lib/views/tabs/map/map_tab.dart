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

  CameraPosition cameraPosition = const CameraPosition(
      zoom: 16, target: LatLng(37.43296265331129, -122.08832357078792));

  late Set<Marker> markers = {
    Marker(markerId: const MarkerId("1"), position: cameraPosition.target)
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            heroTag: "map_tab",
            onPressed: () {
              updateLocation();
            },
            child: const Icon(
              Icons.pin_drop,
              color: Colors.white,
            )),
        body: GoogleMap(
            onTap: (LatLng place) async {
              List<Placemark> places = await placemarkFromCoordinates(
                  place.latitude, place.longitude);
              if (places.isNotEmpty) {
                mapController
                    .animateCamera(CameraUpdate.newLatLngZoom(place, 16));

                setState(() {
                  markers.clear();
                  markers.add(Marker(markerId: MarkerId("1"), position: place));
                });

                // Navigator.pop(context, places[0]);
              }
            },
            onMapCreated: (GoogleMapController controller) {
              mapController = controller;
            },
            markers: markers,
            mapType: MapType.normal,
            initialCameraPosition: cameraPosition));
  }

  void updateLocation() {
    Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      LatLng currentLocation = LatLng(position.latitude, position.longitude);
      mapController
          .animateCamera(CameraUpdate.newLatLngZoom(currentLocation, 18));

      setState(() {
        markers.clear();
        markers.add(Marker(markerId: MarkerId("1"), position: currentLocation));
      });
    });
  }
}
