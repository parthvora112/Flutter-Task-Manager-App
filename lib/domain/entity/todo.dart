import 'package:equatable/equatable.dart';

class Todo with EquatableMixin{
  Todo({
    this.id,
    this.title,
    this.description,
  });

  int? id;
  String? title;
  String? description;

  @override
  List<Object?> get props => [
    id,
    title,
    description,
  ];
}
