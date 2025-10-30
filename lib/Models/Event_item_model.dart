import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:myeventlyapp/Models/category_model.dart';

class EventModel {
  String? id;
  CategoryModel category;
  String title;
  String description;
  DateTime date;

  EventModel({
    this.id,
    required this.category,
    required this.title,
    required this.description,
    required this.date,
  });

  EventModel.fromJson(Map<String, dynamic> json)
    : this(
        id: json["id"],
        category: CategoryModel.categories.firstWhere(
          (category) => category.id == json["categoryId"],
        ),
        title: json["title"],
        description: json["description"],
        date: (json["dateTime"] as Timestamp).toDate(),
      );
  // EventModel.fromjson(Map<String, dynamic> json) {
  //   id = json['id'];
  //   category = CategoryModel.categories.firstWhere(
  //     (category) => category.id == json['categoryid'],
  //   );
  //   title = json['title'];
  //   description = json['description'];
  //   date = DateTime.parse(json['date']);
  // }

  Map<String, dynamic> tojson() => {
    "id": id,
    "categoryid": category.id,
    "title": title,
    "description": description,
    "date": date.toIso8601String(),
  };
}
