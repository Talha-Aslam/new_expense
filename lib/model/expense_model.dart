import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

final formater = DateFormat.yMd();

enum Category { food, leisure, travel, work }

const categoryIcon = {
  Category.food: Icons.dining_outlined,
  Category.leisure: Icons.local_activity_outlined,
  Category.travel: Icons.flight_takeoff_rounded,
  Category.work: Icons.work_outline_rounded,
};

class ExpenseModel {
  ExpenseModel({
    required this.amount,
    required this.category,
    required this.date,
    required this.title,
  }) : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  get formateddate {
    return formater.format(date);
  }
}
