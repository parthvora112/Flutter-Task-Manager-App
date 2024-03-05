import 'dart:async';
import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:task_manager_app/data/source/local/local_storage.dart';
import 'package:task_manager_app/domain/repository/todo_repository.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entity/todo.dart';

part 'todo_event.dart';

part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodoInitial()) {
    TodoRepository todoRepository = TodoRepository();

    on<TodoEvent>((event, emit) async {
      emit(TodoLoading());
      if (event is GetTodos) {
        try {
          List<Todo> todos = await todoRepository.getTodos();
          emit(TodoLoaded(todos: todos));
        } catch (e) {
          emit(const TodoError(errorMessage: 'No data found'));
        }
      } else if (event is AddTodo) {
        try {
          await todoRepository.addTodo(todo: event.todo!);
          emit(TodoLoaded(todos: await todoRepository.getTodos()));
        } catch (e) {
          emit(const TodoError(errorMessage: 'Data not added'));
        }
      } else if (event is DeleteTodo) {
        try {
          await todoRepository.deleteTodo(id: event.id!);
          emit(TodoLoaded(todos: await todoRepository.getTodos()));
        } catch (e) {
          emit(const TodoError(errorMessage: 'Data not deleted'));
        }
      }
    });
  }
}
