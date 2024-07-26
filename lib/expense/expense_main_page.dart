import 'package:flutter/material.dart';
import 'package:new_expense/expense/expense_list_view.dart';
import 'package:new_expense/expense/new_expense.dart';
import 'package:new_expense/model/expense_model.dart';

class ExpenseMainPage extends StatefulWidget {
  const ExpenseMainPage({super.key});
  @override
  State<ExpenseMainPage> createState() {
    return _ExpenseMainPageState();
  }
}

class _ExpenseMainPageState extends State<ExpenseMainPage> {
  //List to store the data
  final List<ExpenseModel> _registeredExpenses = [
    ExpenseModel(
        amount: 20,
        category: Category.food,
        date: DateTime.now(),
        title: "Food"),
    ExpenseModel(
        amount: 20,
        category: Category.food,
        date: DateTime.now(),
        title: "Food")
  ];

  //on removing the data
  void _onRemoveData(ExpenseModel expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: const Text("Expense Deleted"),
      action: SnackBarAction(
          label: "Undo",
          onPressed: () {
            setState(() {
              _registeredExpenses.insert(expenseIndex, expense);
            });
          }),
    ));
  }

  void _onSavingExpense(ExpenseModel expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

//Adding new expense by using app bar action button
  void _onViewExpenseOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(
        onSaveExpense: _onSavingExpense,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        leading: Image.asset("assets/images/expense.png"),
        title: const Text('Expense_tracker'),
        actions: [
          IconButton(
              onPressed: _onViewExpenseOverlay,
              icon: const Icon(
                Icons.add,
                color: Colors.white,
              ))
        ],
      ),
      body: ExpenseListView(
        expense: _registeredExpenses,
        onRemoveExpense: _onRemoveData,
      ),
    );
  }
}
