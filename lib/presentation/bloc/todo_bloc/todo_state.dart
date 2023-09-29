import 'package:skillbox_app/domain/entity/todo.dart';

abstract class TodoState {}

class TodoInitialState extends TodoState {}

class TodoLoadingState extends TodoState {}

class TodoDataState extends TodoState {
  final List<Todo> todos;
  TodoDataState({required this.todos});
}

class TodoErrorState extends TodoState {}
