import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:myeventlyapp/Models/category_model.dart';

class EventModel {
  String? id;
  CategoryModel category;
  String title;
  String description;
  DateTime date;
  String? userid;
  double? latitude;
  double? longitude;
  String? eventCity;
  String? eventCountry;

  EventModel({
    this.id,
    required this.category,
    required this.title,
    required this.description,
    required this.date,
    this.userid,
    this.latitude,
    this.longitude,
    this.eventCity,
    this.eventCountry,
  });

  EventModel.fromJson(Map<String, dynamic> json)
    : this(
        id: json["id"],
        category: CategoryModel.categories.firstWhere(
          (category) => category.id == json["categoryid"],
        ),
        title: json["title"],
        description: json["description"],
        date: (json["date"] as Timestamp).toDate(),
        userid: json["userid"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        eventCity: json["eventCity"] ?? 'Known City',
        eventCountry: json["eventCountry"] ?? 'Known Country',
      );

  Map<String, dynamic> tojson() => {
    "id": id,
    "categoryid": category.id,
    "title": title,
    "description": description,
    "date": date,
    "userid": userid,
    "latitude": latitude,
    "longitude": longitude,
    "eventCity": eventCity ?? 'Known City',
    "eventCountry": eventCountry ?? 'Known Country',
  };
}


// EventModel.fromjson(Map<String, dynamic> json) {
  //   id = json['id'];
  //   category = CategoryModel.categories.firstWhere(
  //     (category) => category.id == json['categoryid'],
  //   );
  //   title = json['title'];
  //   description = json['description'];
  //   date = DateTime.parse(json['date']);
  // }