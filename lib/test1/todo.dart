import 'package:json_annotation/json_annotation.dart';
part 'todo.g.dart';
@JsonSerializable()
class Todo {
  int userId;
  int id;
  String title;
  String body;

  Todo({this.userId, this.id, this.title, this.body});

  factory Todo.fromJson(Map<String, dynamic> json) => _$TodoFromJson(json);

  Map<String, dynamic> toJson() => _$TodoToJson(this);
}
