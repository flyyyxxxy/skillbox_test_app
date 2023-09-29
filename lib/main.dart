import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skillbox_app/di.dart';
import 'package:skillbox_app/presentation/bloc/todo_bloc/todo_bloc.dart';
import 'package:skillbox_app/presentation/bloc/user_bloc/user_bloc.dart';
import 'package:skillbox_app/presentation/screen/chat_page.dart';
import 'package:skillbox_app/presentation/screen/home_page.dart';

void main() {
  setupDi();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TodoBloc>(
          create: (context) => TodoBloc(getTodosUseCase: di()),
        ),
        BlocProvider<UserBloc>(
          create: (context) => UserBloc(getUsersUseCase: di()),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Test App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const HomePage(),
          '/chat': (context) => const ChatPage(),
        },
      ),
    );
  }
}
