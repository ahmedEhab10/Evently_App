import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:myeventlyapp/Models/Event_item_model.dart';
import 'package:myeventlyapp/firebase/firebase_service.dart';

class MapProvaider extends ChangeNotifier {
  MapProvaider() {
    setlocationlistner();
    getuserlocation();
    getEventFromFirestore();
  }
  Set<Marker> markers = {};
  final Location location = Location();
  String locationmessage = '';
  GoogleMapController? mapController;
  late StreamSubscription<LocationData> listener;
  List<EventModel> events = [];

  Future<void> getEventFromFirestore() async {
    events = await FirebaseService.getEventFromFirestore();
    notifyListeners();
  }

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

  void navigatetoeventlocation(LatLng location) {
    if (mapController == null) return;
    CameraPosition cameraPosition = CameraPosition(target: location, zoom: 17);
    markers.add(
      Marker(
        markerId: MarkerId(UniqueKey().toString()),
        position: location,
        infoWindow: InfoWindow(
          title: 'Event Location ',
          snippet: 'Event Location',
        ),
      ),
    );
    mapController!.animateCamera(
      CameraUpdate.newCameraPosition(cameraPosition),
    );
    notifyListeners();
  }

  Future<bool> checkLocationService() async {
    bool isGpsServiceEnabled = await location.serviceEnabled();
    if (!isGpsServiceEnabled) {
      isGpsServiceEnabled = await location.requestService();
    }
    return isGpsServiceEnabled;
  }

  void changeCameraPosition(LocationData locationData) {
    if (mapController == null) return;
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
    mapController!.animateCamera(
      CameraUpdate.newCameraPosition(cameraPosition),
    );
  }

  void setlocationlistner() {
    listener = location.onLocationChanged.listen((
      LocationData currentLocation,
    ) {
      location.changeSettings(accuracy: LocationAccuracy.high, interval: 500);
      changeCameraPosition(currentLocation);
      notifyListeners();
    });
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
    changeCameraPosition(locationData);
    notifyListeners();
  }

  @override
  void dispose() {
    listener.cancel();
    mapController!.dispose();
    log('out of map provider');
    super.dispose();
  }
}
