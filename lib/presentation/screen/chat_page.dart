import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skillbox_app/presentation/bloc/user_bloc/user_bloc.dart';
import 'package:skillbox_app/presentation/bloc/user_bloc/user_state.dart';
import 'package:skillbox_app/presentation/widget/user_card.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat page'),
      ),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserDataState) {
            return ListView.builder(
              itemCount: state.selectedUsers.length,
              itemBuilder: (context, index) {
                final user = state.selectedUsers[index];
                return UserCard(
                  user: user,
                  isSelected: false,
                  isSelectable: false,
                );
              },
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
