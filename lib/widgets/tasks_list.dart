import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reorderable_todo_list/models/task_data.dart';
import 'package:reorderable_todo_list/widgets/task_tile.dart';

class TasksList extends StatefulWidget {
  const TasksList({super.key});

  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ReorderableListView.builder(
          itemBuilder: (context, index) {
            final task = taskData.tasks[index];
            return Dismissible(
              key: Key(task.name),
              onDismissed: (direction) {
                setState(() {
                  taskData.removeTask(task);
                });
              },
              child: TaskTile(
                key: ValueKey(task.name),
                taskTitle: task.name,
                isChecked: task.isDone,
                checkboxCallback: (checkboxState) {
                  taskData.updateTask(task);
                },
                deleteCallback: (direction) {
                  taskData.removeTask(task);
                },
              ),
            );
          },
          itemCount: taskData.taskCount,
          onReorder: (oldIndex, newIndex) {
            final index = newIndex > oldIndex ? newIndex - 1 : newIndex;

            final user = taskData.tasks.removeAt(oldIndex);
            taskData.tasks.insert(index, user);
          },
        );
      },
    );
  }
}

