import 'package:expenses_app/models/expense_model.dart';
import 'package:expenses_app/widgets/expenses_list/expenses_list.dart';
import 'package:expenses_app/widgets/show_bottom_sheet.dart';
import 'package:flutter/material.dart';

class HomeExpenses extends StatefulWidget {
  const HomeExpenses({super.key});

  @override
  State<HomeExpenses> createState() => _HomeExpensesState();
}

class _HomeExpensesState extends State<HomeExpenses> {
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
  ];
  void addExpense(Expense expense) {
    setState(() {
      _listExpense.add(expense);
    });
  }

  void removeExpense(Expense expense) {
    setState(() {
      _listExpense.remove(expense);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expenses'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                useSafeArea: true,
                isScrollControlled: true,
                context: context,
                builder: (ese) => ShowBottomSheetWidget(
                  addExpenseToSheet: addExpense,
                ),
              );
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('...'),
            Expanded(
              child: ExpensesList(
                listExpense: _listExpense,
                removeExpenseToSheet: removeExpense,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
