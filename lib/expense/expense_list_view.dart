import 'package:flutter/material.dart';
import 'package:new_expense/expense/expense_item_card.dart';
import 'package:new_expense/model/expense_model.dart';

class ExpenseListView extends StatelessWidget {
  const ExpenseListView({required this.expense, super.key});
  final List<ExpenseModel> expense;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: expense.length,
        itemBuilder: (context, index) => Dismissible(
            key: ValueKey(
              expense[index],
            ),
            background: Container(
              color: Colors.red,
              child: const Icon(Icons.delete_forever_outlined),
            ),
            child: ExpenseItemCard(
              expense: expense[index],
            )));
  }
}
