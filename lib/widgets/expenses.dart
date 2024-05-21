import 'package:expenses_app/models/expense_model.dart';
import 'package:expenses_app/widgets/expenses_list/expenses_list.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _listExpense = [
    Expense(
        title: 'Breakfast',
        amount: 25.5,
        date: DateTime.now(),
        category: Category.food),
    Expense(
        title: 'flutter course',
        amount: 30.5,
        date: DateTime.now(),
        category: Category.work),
    Expense(
        title: 'Go Travel',
        amount: 40.5,
        date: DateTime.now(),
        category: Category.travel),
    Expense(
        title: 'swamming',
        amount: 15.0,
        date: DateTime.now(),
        category: Category.leisure),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('....'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('...'),
            Expanded(child: ExpensesList(listExpense: _listExpense)),
          ],
        ),
      ),
    );
  }
}
