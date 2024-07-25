import 'package:flutter/material.dart';

class CreateExpense extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 10,
      ),
      child: Column(
        children: [
          TextField(
            keyboardType: TextInputType.text,
            maxLength: 50,
          ),
          Row(children: [
            TextField(
              keyboardType: TextInputType.number,
            ),
            Spacer(),
            Expanded(
              child: Row(
                children: [
                  Text(
                    "Selected Text",
                    style: TextStyle(fontSize: 10),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.calendar_month_outlined,
                      ))
                ],
              ),
            )
          ])
        ],
      ),
    );
  }
}
