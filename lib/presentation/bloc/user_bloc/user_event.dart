abstract class UserEvent {}

class GetUserEvent extends UserEvent {}

class SelectUser extends UserEvent {
  final int id;
  SelectUser(this.id);
}
