import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapProvaider extends ChangeNotifier {
  MapProvaider() {
    getuserlocation();
  }
  Set<Marker> markers = {};
  final Location location = Location();
  String locationmessage = '';
  late GoogleMapController mapController;

  CameraPosition cameraPosition = const CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 17,
  );
  Future<bool> getlicationpermission() async {
    PermissionStatus permissionStatus = await location.hasPermission();
    if (permissionStatus == PermissionStatus.denied) {
      permissionStatus = await location.requestPermission();
    }
    return permissionStatus == PermissionStatus.granted;
  }

  Future<bool> checkLocationService() async {
    bool isGpsServiceEnabled = await location.serviceEnabled();
    if (!isGpsServiceEnabled) {
      isGpsServiceEnabled = await location.requestService();
    }
    return isGpsServiceEnabled;
  }

  Future<void> getuserlocation() async {
    bool ispermissiongranted = await getlicationpermission();
    if (!ispermissiongranted) {
      locationmessage = 'permission not granted';
      notifyListeners();
      return;
    }
    bool isGpsServiceEnabled = await checkLocationService();
    if (!isGpsServiceEnabled) {
      locationmessage = 'Location Service not enabled';
      notifyListeners();
      return;
    }

    LocationData locationData = await location.getLocation();
    CameraPosition cameraPosition = CameraPosition(
      target: LatLng(locationData.latitude ?? 0, locationData.longitude ?? 0),
      zoom: 17,
    );
    markers.add(
      Marker(
        markerId: MarkerId('1'),
        position: LatLng(
          locationData.latitude ?? 0,
          locationData.longitude ?? 0,
        ),
      ),
    );
    mapController.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }

  @override
  void dispose() {
    log('out of map provider');
    super.dispose();
  }
}
