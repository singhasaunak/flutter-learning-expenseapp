import 'package:flutter/material.dart';
import 'package:flutter_learning_expenseapp/models/expense.dart';
import 'package:flutter_learning_expenseapp/widgets/expense_object.dart';

class ExpenseList extends StatelessWidget {
  ExpenseList({super.key, required this.expensesList});

  List<Expense> expensesList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expensesList.length,
      itemBuilder: (context, index) {
        return ExpenseObject(expense: expensesList[index]);
      },
    );
  }
}
