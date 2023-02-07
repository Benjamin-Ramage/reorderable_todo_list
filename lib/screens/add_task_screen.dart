import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reorderable_todo_list/models/task_data.dart';
import 'package:reorderable_todo_list/theme/colours.dart';

// ignore: must_be_immutable
class AddTaskScreen extends StatelessWidget {
  String newTaskTitle = '';
  String newSubtitleText = '';

  AddTaskScreen({
    required this.newTaskTitle,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColours.darkGrey,
      child: Container(
        height: 130.0,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
          ),
          boxShadow: [
            BoxShadow(
              offset: Offset(0.0, 0.0),
              blurRadius: 5.0,
              spreadRadius: 0.0,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(
                    bottom: 20.0,
                    right: 20.0,
                    left: 20.0,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 5.0,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 0.0),
                        blurRadius: 5.0,
                        spreadRadius: 0.0,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: TextField(
                    onChanged: (newText){
                      newTaskTitle = newText;
                    },
                    autofocus: true,
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Add a new item to the list...'
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  bottom: 20.0,
                  right: 20.0,
                ),
                child: FloatingActionButton(
                  backgroundColor: AppColours.teal,
                  onPressed: (){
                    const text = 'Item added to your list';
                    final snackBar = SnackBar(
                      duration: const Duration(seconds: 20),
                      content: const Text(text),
                      action: SnackBarAction(
                        label: 'Dismiss',
                        onPressed: (){

                        },
                      ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    Provider.of<TaskData>(context, listen: false).addTask(newTaskTitle);
                    Navigator.pop(context);
                  },
                    child: const Icon(FontAwesomeIcons.plus),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
