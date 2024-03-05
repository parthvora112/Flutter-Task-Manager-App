import 'package:flutter/material.dart';

import '../../utils/strings.dart';
import '../bloc/todo_bloc.dart';
import '../widgets/app_button.dart';
import '../widgets/outline_app_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeleteTaskDialog extends StatefulWidget {
  final int id;
  const DeleteTaskDialog({super.key,required this.id});

  @override
  State<DeleteTaskDialog> createState() => _DeleteTaskDialogState();
}

class _DeleteTaskDialogState extends State<DeleteTaskDialog> {
  late TodoBloc todoBloc = BlocProvider.of<TodoBloc>(context);

  _deleteTask() {
    Navigator.pop(context);
    todoBloc.add(DeleteTodo(id: widget.id));
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      title: const Text(Strings.deleteTask,textAlign: TextAlign.center),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(Strings.deleteTaskMsg,textAlign: TextAlign.center),
          const SizedBox(height: 30),
          Row(
            children: [
              Expanded(
                child: OutlineAppButton(
                  text: Strings.cancel,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: AppButton(
                  text: Strings.delete,
                  onPressed: () {
                    _deleteTask();
                  },
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
