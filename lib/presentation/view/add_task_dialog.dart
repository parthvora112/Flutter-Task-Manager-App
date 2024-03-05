import 'package:task_manager_app/domain/entity/todo.dart';
import 'package:task_manager_app/presentation/bloc/todo_bloc.dart';
import 'package:task_manager_app/presentation/widgets/app_button.dart';
import 'package:task_manager_app/presentation/widgets/outline_app_button.dart';
import 'package:task_manager_app/utils/common.dart';
import 'package:task_manager_app/utils/strings.dart';
import 'package:task_manager_app/utils/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddTaskDialog extends StatefulWidget {
  const AddTaskDialog({super.key});

  @override
  State<AddTaskDialog> createState() => _AddTaskDialogState();
}

class _AddTaskDialogState extends State<AddTaskDialog> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  late TodoBloc todoBloc = BlocProvider.of<TodoBloc>(context);

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  _addTask() {
    if (_formKey.currentState!.validate()) {
      Navigator.pop(context);
      todoBloc.add(
        AddTodo(
          todo: Todo(
            title: titleController.text,
            description: descriptionController.text,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      title: const Text(Strings.addTask, textAlign: TextAlign.center),
      content: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: titleController,
                decoration: commonInputDecoration(hintText: Strings.taskTitle),
                maxLines: 1,
                textInputAction: TextInputAction.next,
                validator: (value) {
                  return Validators.emptyStringValidation(value);
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: descriptionController,
                decoration: commonInputDecoration(hintText: Strings.description),
                maxLines: 5,
                textInputAction: TextInputAction.newline,
                validator: (value) {
                  return Validators.emptyStringValidation(value);
                },
              ),
              const SizedBox(height: 30),
              Row(
                children: [
                  Expanded(
                      child: OutlineAppButton(
                          text: Strings.cancel,
                          onPressed: () {
                            Navigator.pop(context);
                          })),
                  const SizedBox(width: 10),
                  Expanded(
                      child: AppButton(
                          text: Strings.add,
                          onPressed: () {
                            _addTask();
                          })),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
