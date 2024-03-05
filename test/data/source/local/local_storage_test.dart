import 'package:task_manager_app/data/source/local/local_storage.dart';
import 'package:task_manager_app/domain/entity/todo.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:test/test.dart';

void main(){
  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;
  group('DatabaseService Tests', () {
    LocalStorage localStorage = LocalStorage();
    test('Add Todo Test', () async {
      final todo = Todo(title: 'Hii',description: 'Hello, how are you?');
      final insertedId = await localStorage.addTodo(todo);

      expect(insertedId, isNotNull);
    });

    test('Get All Todos Test', () async {
      final tasks = await localStorage.getTodoList();

      expect(tasks, isA<List<Todo>>());
    });


    test('Delete Todo Test', () async {
      final todo = Todo(title: 'Hii',description: 'Hello, how are you?');
      final insertedId = await localStorage.addTodo(todo);

      final rowsAffected = await localStorage.deleteTodo(insertedId);

      expect(rowsAffected, equals(1));
    });
  });
}