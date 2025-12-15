import 'package:flutter/material.dart';
import 'package:flutter_learning_expenseapp/models/expense.dart';

class ExpenseObject extends StatelessWidget {
  const ExpenseObject({required this.expense, super.key});

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(expense.expenseName),
            SizedBox(height: 8),
            Row(
              children: [
                Text("\$${expense.expenseAmount.toStringAsFixed(2)}"),
                Spacer(),
                Row(
                  children: [
                    Icon(Icons.work),
                    SizedBox(width: 8),
                    Text(expense.getFormattedDate),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
