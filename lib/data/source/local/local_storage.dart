import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../../domain/entity/todo.dart';
import '../../dto/todo_dto.dart';

class LocalStorage {
  late Database db;

  Future<Database> createDataBase() async {
    db = await openDatabase(
      join(await getDatabasesPath(), 'todo.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE Todos(id INTEGER PRIMARY KEY, title TEXT, description TEXT)',
        );
      },
      version: 1,
    );
    return db;
  }

  Future<List<Todo>> getTodoList() async {
    await createDataBase();
    List<Map<String,dynamic>> list = await db.query('Todos');
    return list.map((e) => TodoDto.fromJson(e)).toList();
  }

  Future<int> addTodo(Todo todo) async {
    await createDataBase();
    return db.insert('Todos', TodoDto(title: todo.title,description: todo.description).toJson());
  }

  Future<int> deleteTodo(int id) async {
    await createDataBase();
    return db.delete('Todos',where: "id=?",whereArgs: [id]);
  }
}
