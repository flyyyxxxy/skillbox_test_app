import 'package:skillbox_app/data/data_source/todo_data_source.dart';
import 'package:skillbox_app/data/mapper/todo_mapper.dart';
import 'package:skillbox_app/domain/entity/todo.dart';
import 'package:skillbox_app/domain/repository/todo_repository.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoDataSource dataSource;
  TodoRepositoryImpl({required this.dataSource});
  @override
  Future<List<Todo>> fetchTodo() async {
    final result = await dataSource.getTodos();
    return TodoMapper().mapTodoModelListToEntityList(result).toList();
  }
}
