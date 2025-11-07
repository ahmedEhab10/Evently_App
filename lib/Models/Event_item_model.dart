import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:myeventlyapp/Models/category_model.dart';

class EventModel {
  String? id;
  CategoryModel category;
  String title;
  String description;
  DateTime date;
  String? userid;

  EventModel({
    this.id,
    required this.category,
    required this.title,
    required this.description,
    required this.date,
    this.userid,
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
      );

  Map<String, dynamic> tojson() => {
    "id": id,
    "categoryid": category.id,
    "title": title,
    "description": description,
    "date": date,
    "userid": userid,
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