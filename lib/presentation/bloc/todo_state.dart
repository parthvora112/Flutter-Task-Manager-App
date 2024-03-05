part of 'todo_bloc.dart';

abstract class TodoState extends Equatable {
  final List<Todo>? todos;
  final String? errorMessage;

  const TodoState({this.todos, this.errorMessage});

  @override
  List<Object> get props => [];
}

class TodoInitial extends TodoState {}

class TodoLoading extends TodoState {}

class TodoLoaded extends TodoState {
  const TodoLoaded({required List<Todo> todos}) : super(todos: todos);
}

class TodoError extends TodoState {
  const TodoError({required String errorMessage}) : super(errorMessage: errorMessage);
}
