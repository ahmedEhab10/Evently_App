import 'package:flutter/material.dart';

class CategoryModel {
  String id;
  String name;
  IconData icon;
  String imagePath;
  CategoryModel({
    required this.id,
    required this.name,
    required this.icon,
    required this.imagePath,
  });

  static List<CategoryModel> categoriesWithAll = [
    CategoryModel(
      id: "0",
      name: "All",
      icon: Icons.all_inclusive_rounded,
      imagePath: "imagePath",
    ),
    CategoryModel(
      id: "1",
      name: "Sports",
      icon: Icons.sports_football_rounded,
      imagePath: "assets/images/sport.png",
    ),
    CategoryModel(
      id: "2",
      name: "Birthday",
      icon: Icons.cake_rounded,
      imagePath: "assets/images/birthday.png",
    ),
    CategoryModel(
      id: "3",
      name: "Meeting",
      icon: Icons.laptop_mac_rounded,
      imagePath: "assets/images/meeting.png",
    ),
    CategoryModel(
      id: "4",
      name: "Gaming",
      icon: Icons.gamepad_rounded,
      imagePath: "assets/images/gaming.png",
    ),
    CategoryModel(
      id: "5",
      name: "Eating",
      icon: Icons.local_pizza_rounded,
      imagePath: "assets/images/eat.png",
    ),
    CategoryModel(
      id: "6",
      name: "Holiday",
      icon: Icons.holiday_village_rounded,
      imagePath: "assets/images/holiday.png",
    ),
    CategoryModel(
      id: "7",
      name: "Exhibition",
      icon: Icons.water_drop_rounded,
      imagePath: "assets/images/exhibition.png",
    ),
    CategoryModel(
      id: "8",
      name: "Workshop",
      icon: Icons.workspaces_rounded,
      imagePath: "assets/images/workshop.png",
    ),
    CategoryModel(
      id: "9",
      name: "book Club",
      icon: Icons.book_online_rounded,
      imagePath: "assets/images/Book Club.png",
    ),
  ];
  static List<CategoryModel> categories = [
    CategoryModel(
      id: "1",
      name: "Sports",
      icon: Icons.sports_football_rounded,
      imagePath: "assets/images/sport.png",
    ),
    CategoryModel(
      id: "2",
      name: "Birthday",
      icon: Icons.cake_rounded,
      imagePath: "assets/images/birthday.png",
    ),
    CategoryModel(
      id: "3",
      name: "Meeting",
      icon: Icons.laptop_mac_rounded,
      imagePath: "assets/images/meeting.png",
    ),
    CategoryModel(
      id: "4",
      name: "Gaming",
      icon: Icons.gamepad_rounded,
      imagePath: "assets/images/gaming.png",
    ),
    CategoryModel(
      id: "5",
      name: "Eating",
      icon: Icons.local_pizza_rounded,
      imagePath: "assets/images/eat.png",
    ),
    CategoryModel(
      id: "6",
      name: "Holiday",
      icon: Icons.holiday_village_rounded,
      imagePath: "assets/images/holiday.png",
    ),
    CategoryModel(
      id: "7",
      name: "Exhibition",
      icon: Icons.water_drop_rounded,
      imagePath: "assets/images/exhibition.png",
    ),
    CategoryModel(
      id: "8",
      name: "Workshop",
      icon: Icons.workspaces_rounded,
      imagePath: "assets/images/workshop.png",
    ),
    CategoryModel(
      id: "9",
      name: "book Club",
      icon: Icons.book_online_rounded,
      imagePath: "assets/images/Book Club.png",
    ),
  ];
}
