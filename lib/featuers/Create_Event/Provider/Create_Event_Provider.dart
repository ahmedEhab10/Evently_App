import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart' as geocoding;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:location/location.dart';
import 'package:myeventlyapp/Models/Event_item_model.dart';
import 'package:myeventlyapp/Models/User_Model.dart';
import 'package:myeventlyapp/Models/category_model.dart';
import 'package:myeventlyapp/core/utils/UI_Utils.dart';
import 'package:myeventlyapp/firebase/firebase_service.dart';

class CreateEventProvider extends ChangeNotifier {
  CreateEventProvider() {
    getuserlocation();
  }
  late TextEditingController titleController = TextEditingController();
  late TextEditingController descriptionController = TextEditingController();
  DateTime selectedDateTime = DateTime.now();
  TimeOfDay pickedTimeTemp = TimeOfDay.now();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late CategoryModel selectedCategory = CategoryModel.categories[0];

  Set<Marker> markers = {};
  final Location location = Location();
  String locationmessage = '';
  GoogleMapController? mapController;

  LatLng? eventlocation;
  String? eventCity;
  String? eventCountry;

  String? titlevalidation(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your title';
    }
    if (value.length < 3) {
      return 'Title must be at least 4 characters';
    }
    return null;
  }

  String? descriptionvalidation(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your title';
    }
    if (value.length < 3) {
      return 'Title must be at least 4 characters';
    }
    return null;
  }

  Future<void> selectEventDate(BuildContext context) async {
    selectedDateTime =
        await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime.now(),
          lastDate: DateTime.now().add(Duration(days: 365)),
        ) ??
        selectedDateTime;
    selectedDateTime = selectedDateTime.copyWith(
      hour: pickedTimeTemp.hour,
      minute: pickedTimeTemp.minute,
    );
    print(selectedDateTime);
    notifyListeners();
  }

  Future<void> selectEventTime(BuildContext context) async {
    pickedTimeTemp =
        await showTimePicker(context: context, initialTime: TimeOfDay.now()) ??
        pickedTimeTemp;

    selectedDateTime = selectedDateTime.copyWith(
      hour: pickedTimeTemp.hour,
      minute: pickedTimeTemp.minute,
    );
    notifyListeners();
  }

  String viewMonthName(DateTime date) {
    return DateFormat('MMM').format(date);
  }

  Future<void> createEvent(BuildContext context) async {
    EventModel event = EventModel(
      category: selectedCategory,
      title: titleController.text,
      description: descriptionController.text,
      date: selectedDateTime,
      userid: UserModel.currentUser!.id,
      latitude: eventlocation!.latitude,
      longitude: eventlocation!.longitude,
      eventCity: eventCity,
      eventCountry: eventCountry,
    );
    UiUtils.showloading(context);
    await FirebaseService.addEventToFirestore(event);
    UiUtils.hideloading(context);
    Navigator.pop(context);
  }

  void onCategoryItemClicked(CategoryModel category) {
    selectedCategory = category;
    notifyListeners();
  }

  late CameraPosition cameraPosition = const CameraPosition(
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

  void changeCameraPosition(LocationData locationData) {
    if (mapController == null) return;
    CameraPosition cameraPosition = CameraPosition(
      target: LatLng(locationData.latitude ?? 0, locationData.longitude ?? 0),
      zoom: 17,
    );
    markers.add(
      Marker(
        markerId: MarkerId('2'),
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

  PickEventLocation(LatLng location) {
    eventlocation = location;
    markers.add(
      Marker(
        markerId: MarkerId('1'),
        position: location,
        infoWindow: InfoWindow(title: 'Event Location'),
      ),
    );

    notifyListeners();
  }

  Future<void> convertlatlangforevent() async {
    if (eventlocation == null) return;

    try {
      final placemarks = await geocoding.placemarkFromCoordinates(
        eventlocation!.latitude,
        eventlocation!.longitude,
      );

      if (placemarks.isNotEmpty) {
        final place = placemarks.first;

        eventCity =
            place.locality ??
            place.subAdministrativeArea ??
            place.administrativeArea ??
            'Unknown City';

        eventCountry = place.country ?? 'Unknown Country';

        print('📍 Event City: $eventCity');
        print('🌍 Event Country: $eventCountry');

        notifyListeners();
      }
    } catch (e) {
      print('❌ Error converting coordinates: $e');
    }
  }
}
