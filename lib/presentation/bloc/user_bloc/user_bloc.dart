import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skillbox_app/core/use_case.dart';
import 'package:skillbox_app/domain/use_case/get_users_usecase.dart';
import 'package:skillbox_app/presentation/bloc/user_bloc/user_event.dart';
import 'package:skillbox_app/presentation/bloc/user_bloc/user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final GetUsersUseCase getUsersUseCase;
  UserBloc({required this.getUsersUseCase}) : super(UserInitialState()) {
    on<GetUserEvent>(_getUsers);
    on<SelectUser>(_selectUser);
    add(GetUserEvent());
  }

  FutureOr<void> _getUsers(GetUserEvent event, Emitter<UserState> emit) async {
    emit(UserLoadingState());
    final res = await getUsersUseCase.execute(NoParams());
    if (res.isLeft) {
      emit(UserErrorState());
    } else {
      emit(UserDataState(users: res.right, selectedUsersId: {}));
    }
  }

  FutureOr<void> _selectUser(SelectUser event, Emitter<UserState> emit) {
    if (state is UserDataState) {
      final oldState = state as UserDataState;
      final selectedUsers = Set<int>.from(oldState.selectedUsersId);
      if (selectedUsers.contains(event.id)) {
        selectedUsers.remove(event.id);
      } else {
        selectedUsers.add(event.id);
      }
      emit(oldState.copyWith(selectedUsersId: selectedUsers));
    }
  }
}
