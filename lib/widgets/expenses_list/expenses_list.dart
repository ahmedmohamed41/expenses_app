import 'package:expenses_app/models/expense_model.dart';
import 'package:expenses_app/widgets/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key, required this.listExpense});
  final List<Expense> listExpense;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listExpense.length,
      itemBuilder: (context, index) => Center(
          child: ExpenseItem(
        item: listExpense[index],
        icon: listIcon[index],
      )),
    );
  }
}
