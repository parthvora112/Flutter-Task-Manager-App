import 'package:task_manager_app/presentation/bloc/todo_bloc.dart';
import 'package:task_manager_app/presentation/view/todo_list_screen.dart';
import 'package:task_manager_app/utils/app_theme.dart';
import 'package:task_manager_app/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MultiBlocProvider(providers: [
    BlocProvider<TodoBloc>(
      create: (context) => TodoBloc(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Strings.title,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.appTheme,
      home: const TodoListScreen(),
    );
  }
}
