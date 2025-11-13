import 'package:flutter/material.dart';
import 'package:myeventlyapp/Models/Event_item_model.dart';
import 'package:myeventlyapp/firebase/firebase_service.dart';

class FavoriteProvider extends ChangeNotifier {
  FavoriteProvider() {
    getallfavoriteEvents();
  }
  List<EventModel> allfavoriteEvents = [];
  List<EventModel> searchEvent = [];

  void getallfavoriteEvents() async {
    allfavoriteEvents = await FirebaseService.getFavoriteEvents();
    notifyListeners();
  }

  List<EventModel> handelsearch(String search) {
    searchEvent = allfavoriteEvents
        .where(
          (element) =>
              element.title.toLowerCase().contains(search.toLowerCase()),
        )
        .toList();
    return searchEvent;
  }
}
