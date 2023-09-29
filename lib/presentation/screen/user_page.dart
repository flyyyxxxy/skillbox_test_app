import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skillbox_app/presentation/bloc/user_bloc/user_bloc.dart';
import 'package:skillbox_app/presentation/bloc/user_bloc/user_state.dart';
import 'package:skillbox_app/presentation/widget/user_card.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocBuilder<UserBloc, UserState>(builder: ((context, state) {
      if (state is UserInitialState || state is UserLoadingState) {
        return const Center(child: CircularProgressIndicator());
      } else if (state is UserErrorState) {
        return const Center(child: Text('Error'));
      } else if (state is UserDataState) {
        return ListView.builder(
          itemCount: state.users.length,
          itemBuilder: (context, index) {
            final user = state.users[index];
            return UserCard(
              user: user,
              isSelected: state.selectedUsersId.contains(user.id),
              isSelectable: true,
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
