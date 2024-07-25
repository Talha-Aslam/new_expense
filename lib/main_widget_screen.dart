import 'package:flutter/material.dart';
import 'package:new_expense/widgets/create_expense.dart';
import 'package:new_expense/widgets/expense_list_view.dart';

class MainWidgetScreen extends StatefulWidget {
  const MainWidgetScreen({super.key});
  @override
  State<MainWidgetScreen> createState() {
    return _MainWidgetScreenState();
  }
}

class _MainWidgetScreenState extends State<MainWidgetScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.orange,
        leading: Image.asset(
          "assets/images/expense.png",
          height: 5,
          width: 5,
        ),
        title: const Text(
          'Expense Tracker',
          style: TextStyle(
              letterSpacing: 3, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        actions: [
          IconButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (ctx) {
                      return CreateExpense();
                    });
              },
              hoverColor: const Color.fromARGB(255, 125, 125, 125),
              icon: const Icon(
                Icons.add,
                size: 30,
              )),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(110, 255, 255, 255),
              Colors.white,
              const Color.fromARGB(255, 247, 195, 119)
            ],
          ),
        ),
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              Text("this will be For chart"),
              const SizedBox(
                height: 20,
              ),
              ExpenseListView(),
            ],
          ),
        ),
      ),
    );
  }
}
