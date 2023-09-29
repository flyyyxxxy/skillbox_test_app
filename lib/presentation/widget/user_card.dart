import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skillbox_app/domain/entity/user.dart';
import 'package:skillbox_app/presentation/bloc/user_bloc/user_bloc.dart';
import 'package:skillbox_app/presentation/bloc/user_bloc/user_event.dart';

class UserCard extends StatelessWidget {
  final User user;
  final bool isSelected;
  final bool isSelectable;

  const UserCard({
    super.key,
    required this.user,
    required this.isSelected,
    required this.isSelectable,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (isSelectable) {
          context.read<UserBloc>().add(SelectUser(user.id));
        }
      },
      child: Card(
        color: isSelected ? Colors.blue : null,
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.blue,
            child: Text(
              '${user.name[0]}${user.name.split(' ')[1][0]}',
              style: const TextStyle(color: Colors.white),
            ),
          ),
          title: Text(user.name),
          subtitle: Text(user.email),
        ),
      ),
    );
  }
}
