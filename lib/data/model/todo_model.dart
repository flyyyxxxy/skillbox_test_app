import 'package:json_annotation/json_annotation.dart';

part 'todo_model.g.dart';

@JsonSerializable(createToJson: false)
class TodoModel {
  final int id;
  final String title;
  final bool completed;

  TodoModel({required this.id, required this.title, required this.completed});

  factory TodoModel.fromJson(Map<String, dynamic> json) => _$TodoModelFromJson(json);
}
