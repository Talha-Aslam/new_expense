import "package:flutter/material.dart";
import "package:new_expense/expense/expense_main_page.dart";

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ExpenseMainPage(),
  ));
}
