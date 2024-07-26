import 'package:flutter/material.dart';
import 'package:new_expense/model/expense_model.dart';

class ExpenseItemCard extends StatelessWidget {
  const ExpenseItemCard({required this.expense, super.key});

  final ExpenseModel expense;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(expense.title),
            Row(
              children: [
                Text(expense.amount.toStringAsFixed(2)),
                const Spacer(),
                Row(children: [
                  Icon(categoryIcon[expense.category]),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(expense.formateddate),
                ])
              ],
            )
          ],
        ),
      ),
    );
  }
}
