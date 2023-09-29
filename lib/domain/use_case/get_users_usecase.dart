import 'package:skillbox_app/core/either.dart';
import 'package:skillbox_app/core/use_case.dart';
import 'package:skillbox_app/domain/entity/user.dart';
import 'package:skillbox_app/domain/repository/user_repository.dart';

class GetUsersUseCase extends AsyncUsecase<NoParams, Either<UseCaseFailure, List<User>>> {
  final UserRepository repository;

  GetUsersUseCase(this.repository);

  @override
  Future<Either<UseCaseFailure, List<User>>> execute(NoParams? params) async {
    try {
      final users = await repository.getUsers();
      return Either.right(users);
    } catch (e) {
      return Either.left(UseCaseFailure());
    }
  }
}
