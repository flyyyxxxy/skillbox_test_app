import 'package:skillbox_app/domain/entity/user.dart';

abstract class UserState {}

class UserInitialState extends UserState {}

class UserLoadingState extends UserState {}

class UserDataState extends UserState {
  final List<User> users;
  final Set<int> selectedUsersId;
  UserDataState({required this.users, required this.selectedUsersId});

  UserDataState copyWith({
    List<User>? users,
    Set<int>? selectedUsersId,
  }) =>
      UserDataState(
        users: users ?? this.users,
        selectedUsersId: selectedUsersId ?? this.selectedUsersId,
      );

  List<User> get selectedUsers {
    return users.where((user) => selectedUsersId.contains(user.id)).toList();
  }
}

class UserErrorState extends UserState {}
