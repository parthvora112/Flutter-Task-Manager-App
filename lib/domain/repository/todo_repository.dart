import 'package:task_manager_app/data/source/local/local_storage.dart';

import '../entity/todo.dart';

class TodoRepository {
  Future<List<Todo>> getTodos() => LocalStorage().getTodoList();
  Future<int> addTodo({required Todo todo}) => LocalStorage().addTodo(todo);
  Future<int> deleteTodo({required int id}) => LocalStorage().deleteTodo(id);
}