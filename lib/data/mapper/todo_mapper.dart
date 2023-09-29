import 'package:skillbox_app/data/model/todo_model.dart';
import 'package:skillbox_app/domain/entity/todo.dart';

class TodoMapper {
  Iterable<Todo> mapTodoModelListToEntityList(List<TodoModel> todoModelList) sync* {
    for (var todoModel in todoModelList) {
      yield Todo(
        id: todoModel.id,
        title: todoModel.title,
        completed: todoModel.completed,
      );
    }
  }
}
