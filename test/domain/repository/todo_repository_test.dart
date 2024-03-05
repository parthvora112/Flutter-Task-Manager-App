import 'package:task_manager_app/domain/entity/todo.dart';
import 'package:task_manager_app/domain/repository/todo_repository.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:test/test.dart';

void main() {
  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;
  group('TodoRepository', () {
    test('getTodos returns a list of Todo objects', () async {
      final repository = TodoRepository();

      final todos = await repository.getTodos();
      expect(todos, isA<List<Todo>>());
    });

    test('addTodo returns the id of the added Todo', () async {
      final repository = TodoRepository();
      final newTodo = Todo(id: 1, title: 'New Todo');

      final addedTodoId = await repository.addTodo(todo:newTodo);

      expect(addedTodoId, isNotNull);
    });

    test('deleteTodo returns the id of the deleted Todo', () async {
      final repository = TodoRepository();
      final newTodo = Todo(id: 1, title: 'New Todo');
      final insertedTodoId = await repository.addTodo(todo: newTodo);

      final deletedTodoId = await repository.deleteTodo(id:insertedTodoId);

      expect(deletedTodoId, isNotNull);
    });
  });
}