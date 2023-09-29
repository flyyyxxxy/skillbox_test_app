import 'package:skillbox_app/domain/entity/todo.dart';

abstract class TodoRepository {
  Future<List<Todo>> fetchTodo();
}
