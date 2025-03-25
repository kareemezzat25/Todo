import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapTab extends StatefulWidget {
  const MapTab({super.key});

  @override
  State<MapTab> createState() => _MapTabState();
}

class _MapTabState extends State<MapTab> {
  GoogleMapController? mapController;
  bool _isMapInitialized = false; // Prevent operations before the map is ready

  CameraPosition cameraPosition = const CameraPosition(
    zoom: 16,
    target: LatLng(37.43296265331129, -122.08832357078792),
  );

  Set<Marker> markers = {
    const Marker(
      markerId: MarkerId("1"),
      position: LatLng(37.43296265331129, -122.08832357078792),
    )
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
        ),
      ),
      body: GoogleMap(
        onTap: (LatLng place) async {
          if (!_isMapInitialized) return; // Ensure map is initialized

          List<Placemark> places =
              await placemarkFromCoordinates(place.latitude, place.longitude);

          if (places.isNotEmpty) {
            if (mounted && mapController != null) {
              await Future.delayed(
                  const Duration(milliseconds: 500)); // Delay for smoothness
              mapController!
                  .animateCamera(CameraUpdate.newLatLngZoom(place, 16));
            }

            setState(() {
              markers.clear();
              markers
                  .add(Marker(markerId: const MarkerId("1"), position: place));
            });
          }
        },
        onMapCreated: (GoogleMapController controller) {
          mapController = controller;
          setState(() {
            _isMapInitialized = true; // Mark map as initialized
          });
        },
        markers: markers,
        mapType: MapType.normal,
        initialCameraPosition: cameraPosition,
      ),
    );
  }

  void updateLocation() async {
    if (!_isMapInitialized) return; // Prevent actions if the map isn't ready

    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      LatLng currentLocation = LatLng(position.latitude, position.longitude);

      if (mounted && mapController != null) {
        await Future.delayed(
            const Duration(milliseconds: 500)); // Delay for stability
        mapController!
            .animateCamera(CameraUpdate.newLatLngZoom(currentLocation, 18));
      }

      setState(() {
        markers.clear();
        markers.add(
            Marker(markerId: const MarkerId("1"), position: currentLocation));
      });
    } catch (error) {
      print("Error fetching location: $error");
    }
  }
}
