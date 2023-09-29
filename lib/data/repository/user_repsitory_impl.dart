import 'package:skillbox_app/data/data_source/user_data_source.dart';
import 'package:skillbox_app/data/mapper/user_mapper.dart';
import 'package:skillbox_app/domain/entity/user.dart';
import 'package:skillbox_app/domain/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDataSource dataSource;
  UserRepositoryImpl({required this.dataSource});
  @override
  Future<List<User>> getUsers() async {
    final result = await dataSource.getUsers();
    return UserMapper().mapUserModelListToEntityList(result).toList();
  }
}
