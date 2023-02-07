import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reorderable_todo_list/models/task_data.dart';
import 'package:reorderable_todo_list/screens/tasks_screen.dart';
import 'package:reorderable_todo_list/theme/bens_theme.dart';

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    final theme = BensTheme.light();
    return ChangeNotifierProvider(
      create: (context) => TaskData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Ben's Grocery List",
        theme: theme,
        home: const TasksScreen(),
      ),
    );
  }
}