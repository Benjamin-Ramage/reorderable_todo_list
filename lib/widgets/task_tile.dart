import 'package:flutter/material.dart';
import 'package:reorderable_todo_list/theme/colours.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final Function(bool?) checkboxCallback;
  final Function deleteCallback;

  const TaskTile({
    required this.isChecked,
    required this.taskTitle,
    required this.checkboxCallback,
    required this.deleteCallback,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Text(
              taskTitle,
              style: TextStyle(
                fontSize: 20.0,
                color: AppColours.darkGrey,
                fontWeight: FontWeight.bold,
                decoration: isChecked ? TextDecoration.lineThrough : null,
              ),
            ),
          ],
        ),
      ),
      //We added named parameters in the TaskCheckbox for specificity.
      leading: Checkbox(
        activeColor: AppColours.darkGrey,
        value: isChecked,
        onChanged: checkboxCallback,
      ),
    );
  }
}

