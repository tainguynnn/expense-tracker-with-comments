import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const uuid = Uuid();

final formatter = DateFormat.yMd();

const CategoryIcons = {
  Category.food: Icons.dining,
  Category.travel: Icons.flight,
  Category.work: Icons.work,
  Category.leisure: Icons.movie,
};

enum Category {
  food,
  travel,
  leisure,
  work,
}

class Expense {
  // constructor
  Expense({
    required this.category,
    required this.title,
    required this.amount,
    required this.date,
  }) : id = uuid.v4(); //create a unique string id

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  String get formattedDate {
    return formatter.format(date);
  }
}

class ExpenseBucket {
  const ExpenseBucket({
    required this.category,
    required this.expenses,
  });

  ExpenseBucket.forCategory(List<Expense> allExpenses, this.category)
      : expenses = allExpenses.where((expense) => expense.category == category).toList();
      //lấy full list expense và trả về expense có category tương ứng

  final Category category;
  final List<Expense> expenses;

  double get totalExpenses { // tính tổng từng category
    double sum = 0;

    for (final expense in expenses) {
      sum += expense.amount;
    }
    return sum;
  }
}
