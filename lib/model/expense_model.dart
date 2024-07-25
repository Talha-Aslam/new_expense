import 'package:flutter/material.dart';

enum Category { food, lesiure, work, travel }

const catergoryIcons = {
  Category.food: Icons.dining_outlined,
  Category.lesiure: Icons.local_activity_outlined,
  Category.work: Icons.work_outline_outlined,
  Category.travel: Icons.flight_takeoff_rounded,
};

class ExpenseModel {
  ExpenseModel({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  });

  final String title;
  final double amount;
  final DateTime date;
  final Category category;
}
