import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

const uuid = Uuid();
final formatDate = DateFormat.yMd();

final List<IconData> listIcon = [
  Icons.food_bank_rounded,
  Icons.cast_for_education,
  Icons.airplanemode_active_rounded,
  Icons.airline_seat_flat_angled_outlined,
];

void addIcon() {
  listIcon.add(Icons.food_bank_rounded);
}

enum Category { food, travel, leisure, work }

class Expense {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();

  String formattedDate(DateTime date) {
    return formatDate.format(date);
  }
}
