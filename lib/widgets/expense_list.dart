import 'package:flutter/material.dart';
import 'package:flutter_learning_expenseapp/models/expense.dart';
import 'package:flutter_learning_expenseapp/widgets/expense_object.dart';

class ExpenseList extends StatelessWidget {
  ExpenseList({
    super.key,
    required this.expensesList,
    required this.onRemoveExpense,
  });

  List<Expense> expensesList;

  final void Function(Expense expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expensesList.length,
      itemBuilder: (context, index) => Dismissible(
        key: ValueKey(ExpenseObject(expense: expensesList[index])),
        onDismissed: (direction) {
          onRemoveExpense(expensesList[index]);
        },
        child: ExpenseObject(expense: expensesList[index]),
      ),
    );
  }
}
