import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:reorderable_todo_list/models/task_data.dart';
import 'package:reorderable_todo_list/screens/add_task_screen.dart';
import 'package:reorderable_todo_list/theme/colours.dart';
import 'package:reorderable_todo_list/widgets/tasks_list.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({Key? key}) : super(key: key);

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColours.backgroundColour,
      body: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          Positioned(
            top: 60.0,
            child: ClipOval(child: Image.asset('images/avataar_ben.png')),
          ),
          Positioned(
            top: 365.0,
            child: Text(
              "Ben's ToDo List",
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          Positioned(
            top: 420.0,
            child: Text(
              '${Provider.of<TaskData>(context).taskCount} Tasks',
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          Positioned(
            width: (MediaQuery.of(context).size.width),
            top: 450.0,
            bottom: 0,
            child: const TasksList(),
          ),
          Positioned(
            top: 815.0,
            left: 335.0,
            child: FloatingActionButton(
              backgroundColor: AppColours.teal,
              onPressed: (){
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (context) => SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom,
                      ),
                      child: AddTaskScreen(newTaskTitle: '',),
                    ),
                  ),
                );
              },
              child: const Icon(FontAwesomeIcons.plus),
            ),
          ),
        ],
      ),
    );
  }
}