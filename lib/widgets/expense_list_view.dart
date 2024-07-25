import 'package:flutter/material.dart';

class ExpenseListView extends StatefulWidget {
  const ExpenseListView({super.key});
  @override
  State<ExpenseListView> createState() {
    return _ExpenseListViewState();
  }
}

class _ExpenseListViewState extends State<ExpenseListView> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.white, Color.fromARGB(188, 249, 185, 88)],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 15,
            horizontal: 15,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Title"),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Text("amount"),
                  const Spacer(),
                  Icon(Icons.abc),
                  Text("data"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
