import 'package:skillbox_app/data/api/api_service.dart';
import 'package:skillbox_app/data/model/user_model.dart';

abstract class UserDataSource {
  Future<List<UserModel>> getUsers();
}

class UserDataSourceImpl implements UserDataSource {
  final ApiService api;
  UserDataSourceImpl({required this.api});

  @override
  Future<List<UserModel>> getUsers() async {
    return await api.getUsers();
  }
}
