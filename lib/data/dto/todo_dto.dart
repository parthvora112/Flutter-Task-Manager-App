import 'package:task_manager_app/domain/entity/todo.dart';

class TodoDto extends Todo {
  TodoDto({super.id,super.title, super.description});

  TodoDto.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['description'] = description;
    return map;
  }
}
