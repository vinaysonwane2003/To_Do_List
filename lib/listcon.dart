import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoList extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;
  ToDoList({super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 28),
      child: Slidable(
        endActionPane: ActionPane(
          motion: DrawerMotion(),
          children: [
            SlidableAction(
              borderRadius: BorderRadius.circular(10),
                onPressed: deleteFunction,
              icon: Icons.delete_forever,
              backgroundColor: Colors.red,
            )
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.indigoAccent.shade100,
            borderRadius: BorderRadius.circular(10.0)),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Row(
              children: [
                Checkbox(
                  value: taskCompleted,
                  onChanged: onChanged,
                  activeColor: Colors.green,
                ),
                Text(taskName,
                  style: TextStyle(
                      decoration: taskCompleted ? TextDecoration.lineThrough : TextDecoration.none,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
