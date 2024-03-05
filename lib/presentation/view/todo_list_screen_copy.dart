import 'package:task_manager_app/presentation/bloc/todo_bloc.dart';
import 'package:task_manager_app/presentation/view/add_task_dialog.dart';
import 'package:task_manager_app/presentation/view/delete_task_dialog.dart';
import 'package:task_manager_app/utils/colors.dart';
import 'package:flutter/material.dart';
import '../../domain/entity/todo.dart';
import '../../utils/strings.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  late TodoBloc todoBloc;

  @override
  void initState() {
    init();
    super.initState();
  }

  init() {
    todoBloc = BlocProvider.of<TodoBloc>(context);
    todoBloc.add(const GetTodos());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Strings.taskManagerApp),
      ),
      body: BlocListener<TodoBloc, TodoState>(
        listener: (context, state) {
          if (state is TodoError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage!),
              ),
            );
          }
        },
        child: BlocBuilder<TodoBloc, TodoState>(
          builder: (context, state) {
            if (state is TodoInitial) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is TodoLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is TodoLoaded) {
              List<Todo>? todoList = state.todos;
              return todoList != null && todoList.isNotEmpty
                  ? ListView.separated(
                      padding: const EdgeInsets.all(20),
                      itemCount: todoList.length,
                      itemBuilder: (context, index) {
                        Todo todo = todoList[index];
                        return Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(border: Border.all(color: AppColors.borderColor), borderRadius: BorderRadius.circular(8)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(child: Text(todo.title ?? "", style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold))),
                                  const SizedBox(width: 10),
                                  GestureDetector(
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return DeleteTaskDialog(id: todo.id!);
                                        },
                                      );
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(4),
                                      decoration: BoxDecoration(
                                        color: Colors.red.withOpacity(0.2),
                                        border: Border.all(color: Colors.red),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: const Icon(Icons.delete, size: 12, color: Colors.red),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Text(todo.description ?? "", style: const TextStyle(fontSize: 12)),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(height: 16);
                      },
                    )
                  : const Center(child: Text('No data'));
            } else if (state is TodoError) {
              return Center(child: Text(state.errorMessage ?? ""));
            } else {
              return Container();
            }
          },
        ),
      ),
      floatingActionButton: SizedBox(
        height: 40,
        child: FloatingActionButton.extended(
          backgroundColor: AppColors.primaryColor,
          extendedPadding: const EdgeInsets.all(10),
          extendedIconLabelSpacing: 4,
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return const AddTaskDialog();
              },
            );
          },
          icon: const Icon(Icons.add, color: Colors.white),
          label: const Text(Strings.addTask, style: TextStyle(color: Colors.white)),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
    );
  }
}
