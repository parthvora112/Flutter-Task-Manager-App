import 'package:task_manager_app/domain/entity/todo.dart';
import 'package:test/test.dart';

void main(){
  group('Todo', () {
    test('Two instances with the same properties should be equal', () {
      final todo1 = Todo(
        id: 1,
        title: "Hello",
        description: "How are you?",
      );

      final todo2 = Todo(
        id: 1,
        title: "Hello",
        description: "How are you?",
      );

      expect(todo1, equals(todo2));
    });

    test('Two instances with different properties should be different', () {
      final todo1 = Todo(
        id: 1,
        title: "Hello",
        description: "How are you?",
      );

      final todo2 = Todo(
        id: 2,
        title: "Hello",
        description: "How are you?",
      );

      expect(todo1, isNot(equals(todo2)));
    });
  });
}