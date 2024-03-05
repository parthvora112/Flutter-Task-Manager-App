part of 'todo_bloc.dart';

abstract class TodoEvent extends Equatable {
  final Todo? todo;
  final int? id;
  const TodoEvent({this.todo,this.id});

  @override
  List<Object> get props => [];
}

class GetTodos extends TodoEvent {
  const GetTodos();
}

class AddTodo extends TodoEvent {
  const AddTodo({required Todo todo}) : super(todo: todo);
}

class DeleteTodo extends TodoEvent {
  const DeleteTodo({required int id}) : super(id: id);
}