import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learning_expenseapp/models/expense.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onAddNewExpense});

  final void Function(Expense expense) onAddNewExpense;

  @override
  _NewExpenseState createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  DateTime? _selectedDate;
  final _expenseNameInputController = TextEditingController();
  final _expenseAmountInputController = TextEditingController();
  ExpenseCategory _pickedCategory = ExpenseCategory.work;

  void _currentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final pickedDate = await showDatePicker(
      context: context,
      firstDate: firstDate,
      lastDate: now,
    );
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  void _storeExpenseData() {
    final inputAmountNumber = double.tryParse(
      _expenseAmountInputController.text,
    );
    final bool amountIsValid =
        inputAmountNumber != null && inputAmountNumber > 0 ? true : false;
    if (_expenseNameInputController.text.trim().isEmpty ||
        !amountIsValid ||
        _selectedDate == null) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text("Invalid Input"),
          content: const Text("The entered value is not valid."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: Text("Okay"),
            ),
          ],
        ),
      );

      return;
    }

    widget.onAddNewExpense(
      Expense(
        expenseName: _expenseNameInputController.text,
        expenseAmount: inputAmountNumber,
        expenseDate: _selectedDate!,
        expenseCategory: _pickedCategory,
      ),
    );

    Navigator.pop(context);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _expenseNameInputController.dispose();
    _expenseAmountInputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: _expenseNameInputController,
            maxLength: 50,
            decoration: InputDecoration(label: Text("Expense Name")),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _expenseAmountInputController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    label: Text("Expense Amount"),
                    prefix: Text("\$"),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      _selectedDate == null
                          ? "Seclect date"
                          : dateFormatter.format(_selectedDate!),
                    ),
                    IconButton(
                      onPressed: _currentDatePicker,
                      icon: Icon(Icons.calendar_month),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            children: [
              DropdownButton(
                value: _pickedCategory,
                items: ExpenseCategory.values
                    .map(
                      (currentCategory) => DropdownMenuItem(
                        value: currentCategory,
                        child: Text(currentCategory.name.toUpperCase()),
                      ),
                    )
                    .toList(),
                onChanged: (pickedCategoryValue) {
                  if (pickedCategoryValue == null) {
                    return;
                  }
                  setState(() {
                    _pickedCategory = pickedCategoryValue;
                  });
                },
              ),
              Spacer(),
              TextButton(onPressed: () {}, child: const Text("Cancel")),
              ElevatedButton(
                onPressed: () {
                  _storeExpenseData();
                },
                child: Text("Add Expense"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
