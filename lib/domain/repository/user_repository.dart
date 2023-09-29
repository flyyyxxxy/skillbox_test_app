import 'package:skillbox_app/domain/entity/user.dart';

abstract class UserRepository {
  Future<List<User>> getUsers();
}
