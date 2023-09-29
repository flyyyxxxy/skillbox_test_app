import 'package:skillbox_app/data/api/api_service.dart';
import 'package:skillbox_app/data/model/todo_model.dart';

abstract class TodoDataSource {
  Future<List<TodoModel>> getTodos();
}

class TodoDataSourceImpl implements TodoDataSource {
  final ApiService api;
  TodoDataSourceImpl({required this.api});

  @override
  Future<List<TodoModel>> getTodos() async {
    return await api.getTodos();
  }
}
