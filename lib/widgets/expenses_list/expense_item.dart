import 'package:expenses_app/models/expense_model.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  ExpenseItem({super.key, required this.item, required this.icon});
  final Expense item;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Text(item.title),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text("\$ ${item.amount.toString()}"),
              const Spacer(),
              Icon(icon),
              Text(item.formattedDate(item.date)),
            ],
          ),
        ],
      ),
    );
  }
}
