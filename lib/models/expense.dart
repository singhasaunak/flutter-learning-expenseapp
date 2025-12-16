import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();
final dateFormatter = DateFormat.yMd();

enum ExpenseCategory { work, entertainment, food, travel }

const expenseCategoryIcons = {
  ExpenseCategory.food: Icons.dinner_dining,
  ExpenseCategory.work: Icons.work,
  ExpenseCategory.travel: Icons.airport_shuttle,
  ExpenseCategory.entertainment: Icons.celebration,
};

class Expense {
  final String expenseID;
  final String expenseName;
  final double expenseAmount;
  final DateTime expenseDate;
  final ExpenseCategory expenseCategory;

  Expense({
    required this.expenseName,
    required this.expenseAmount,
    required this.expenseDate,
    required this.expenseCategory,
  }) : expenseID = uuid.v4();

  String get getFormattedDate {
    return dateFormatter.format(expenseDate);
  }
}
