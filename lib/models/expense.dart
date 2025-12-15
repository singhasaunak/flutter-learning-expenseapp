import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();
final dateFormatter = DateFormat.yMd();

class Expense {
  final String expenseID;
  final String expenseName;
  final double expenseAmount;
  final DateTime expenseDate;

  Expense({
    required this.expenseName,
    required this.expenseAmount,
    required this.expenseDate,
  }) : expenseID = uuid.v4();

  String get getFormattedDate {
    return dateFormatter.format(expenseDate);
  }
}
