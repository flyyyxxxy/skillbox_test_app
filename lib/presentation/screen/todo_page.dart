import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skillbox_app/presentation/bloc/todo_bloc/todo_bloc.dart';
import 'package:skillbox_app/presentation/bloc/todo_bloc/todo_state.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> with AutomaticKeepAliveClientMixin<TodoPage> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocBuilder<TodoBloc, TodoState>(builder: ((context, state) {
      if (state is TodoLoadingState || state is TodoInitialState) {
        return const Center(child: CircularProgressIndicator());
      } else if (state is TodoErrorState) {
        return const Center(
          child: Text('Error'),
        );
      } else if (state is TodoDataState) {
        return ListView.builder(
          itemCount: state.todos.length,
          itemBuilder: (context, index) {
            final todo = state.todos[index];
            final isCompleted = todo.completed;
            return ListTile(
              title: Text(todo.title),
              tileColor: isCompleted ? Colors.green : null,
            );
          },
        );
      } else {
        return const SizedBox.shrink();
      }
    }));
  }

  @override
  bool get wantKeepAlive => true;
}
