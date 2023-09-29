import 'package:skillbox_app/core/either.dart';
import 'package:skillbox_app/core/use_case.dart';
import 'package:skillbox_app/domain/entity/todo.dart';
import 'package:skillbox_app/domain/repository/todo_repository.dart';

class GetTodosUseCase extends AsyncUsecase<NoParams, Either<UseCaseFailure, List<Todo>>> {
  final TodoRepository repository;

  GetTodosUseCase(this.repository);

  @override
  Future<Either<UseCaseFailure, List<Todo>>> execute(NoParams? params) async {
    try {
      final todos = await repository.fetchTodo();
      return Either.right(todos);
    } catch (e) {
      return Either.left(UseCaseFailure());
    }
  }
}
