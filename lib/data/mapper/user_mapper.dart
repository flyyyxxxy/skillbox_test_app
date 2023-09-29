import 'package:skillbox_app/data/model/user_model.dart';
import 'package:skillbox_app/domain/entity/user.dart';

class UserMapper {
  Iterable<User> mapUserModelListToEntityList(List<UserModel> userModelList) sync* {
    for (var userModel in userModelList) {
      yield User(id: userModel.id, name: userModel.name, email: userModel.email);
    }
  }
}
