import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skillbox_app/core/use_case.dart';
import 'package:skillbox_app/domain/use_case/get_todos_usecase.dart';
import 'package:skillbox_app/presentation/bloc/todo_bloc/todo_event.dart';
import 'package:skillbox_app/presentation/bloc/todo_bloc/todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final GetTodosUseCase getTodosUseCase;
  TodoBloc({required this.getTodosUseCase}) : super(TodoInitialState()) {
    on<FetchTodoEvent>(_fetch);
    add(FetchTodoEvent());
  }

  FutureOr<void> _fetch(FetchTodoEvent event, Emitter<TodoState> emit) async {
    emit(TodoLoadingState());
    final res = await getTodosUseCase.execute(NoParams());
    if (res.isLeft) {
      emit(TodoErrorState());
    } else {
      emit(TodoDataState(todos: res.right));
    }
  }
}
