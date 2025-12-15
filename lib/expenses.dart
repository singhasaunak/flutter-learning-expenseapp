import 'package:flutter/material.dart';
import 'package:flutter_learning_expenseapp/models/expense.dart';
import 'package:flutter_learning_expenseapp/widgets/expense_list.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  _ExpensesState createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> expenses = [
    Expense(
      expenseName: "Metro",
      expenseAmount: 0.99,
      expenseDate: DateTime.now(),
    ),
    Expense(
      expenseName: "Movie Tickets",
      expenseAmount: 2.00,
      expenseDate: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expense Tracker"),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.add))],
      ),
      body: ExpenseList(expensesList: expenses),
    );
  }
}
