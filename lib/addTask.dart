import 'package:flutter/material.dart';
import 'buttons.dart';

class AddTask extends StatelessWidget {
  VoidCallback onSave;
  VoidCallback onCancel;
  final controller;
  AddTask({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  });
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.indigoAccent.shade100,
      content: Container(
        height: 150,
        width: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("ADD TASK",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25
              ),
            ),
            Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)
                ) ,
                child: Padding(
                  padding: const EdgeInsets.only(top: 5, left: 15, right: 15),
                  child: TextField(
                    controller: controller,
                    decoration: InputDecoration(
                        hintText: "Add a new Task"
                    ),
                  ),
                )
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyButton(
                  text: "Save",
                  onPressed: onSave,
                ),
                MyButton(
                  text: "Cancel",
                  onPressed: onCancel,
                ),
              ],
            )
          ],
        ),
      ),
    );;
  }
}
