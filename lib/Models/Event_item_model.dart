import 'package:flutter/material.dart';
import 'package:myeventlyapp/Models/category_model.dart';

class EventModel {
  CategoryModel category;
  String title;
  String description;
  DateTime date;
  TimeOfDay? time;

  EventModel({
    required this.category,
    required this.title,
    required this.description,
    required this.date,
    this.time,
  });
}
