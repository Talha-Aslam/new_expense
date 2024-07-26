import 'package:flutter/material.dart';
import 'package:new_expense/model/expense_model.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({required this.onSaveExpense, super.key});

  final Function(ExpenseModel expense) onSaveExpense;

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final _titlecontroller = TextEditingController();
  final _amountcontroller = TextEditingController();
  DateTime? selecteddate;
  Category selectedCategory = Category.food;

  void _presentDatePicker() async {
    final datenow = DateTime.now();
    final fistdate = DateTime(datenow.year - 2);
    final pickedDate = await showDatePicker(
        context: context, firstDate: fistdate, lastDate: datenow);

    setState(() {
      selecteddate = pickedDate;
    });
  }

  void _submitExpenseData() {
    final enteredamount = double.tryParse(_amountcontroller.text);
    final amountIsValid = enteredamount == null || enteredamount <= 0;

    if (_titlecontroller.text.trim().isEmpty ||
        amountIsValid ||
        selecteddate == null) {
      showDialog(
          context: context,
          builder: (ctx) {
            return AlertDialog(
              title: const Text('Invalid Input'),
              content:
                  const Text('One of the Following field is empty or invalid'),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(ctx);
                    },
                    child: const Text("okay")),
              ],
            );
          });
      return;
    }
    widget.onSaveExpense(ExpenseModel(
        amount: enteredamount,
        category: selectedCategory,
        date: selecteddate!,
        title: _titlecontroller.text));
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _titlecontroller.dispose();
    _amountcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Column(
        children: [
          TextField(
            maxLength: 50,
            keyboardType: TextInputType.text,
            controller: _titlecontroller,
            decoration: const InputDecoration(label: Text("Title")),
          ),
          Row(
            children: [
              Expanded(
                  child: TextField(
                keyboardType: TextInputType.number,
                controller: _amountcontroller,
                decoration: const InputDecoration(
                  label: Text("Amount"),
                  prefixText: "\$ ",
                ),
              )),
              const Spacer(),
              Row(
                children: [
                  Text(selecteddate == null
                      ? "Select Date"
                      : formater.format(selecteddate!)),
                  IconButton(
                      onPressed: _presentDatePicker,
                      icon: const Icon(Icons.calendar_month_outlined))
                ],
              ),
            ],
          ),
          Row(children: [
            DropdownButton(
              value: selectedCategory,
              items: Category.values
                  .map((category) => DropdownMenuItem(
                      value: category,
                      child: Text(category.name.toUpperCase())))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedCategory = value as Category;
                });
              },
            ),
            const Spacer(),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Cancle")),
            const SizedBox(
              width: 5,
            ),
            ElevatedButton(
                onPressed: _submitExpenseData, child: const Text("Save"))
          ])
        ],
      ),
    );
  }
}
