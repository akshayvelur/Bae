part of 'profile_bloc.dart';

@immutable
abstract class ProfileEvent {}
class InitStateEvent extends ProfileEvent{
  // final UserModel user;
  // InitStateEvent({required this.user});
}

class NavigateToUserDataEvent extends ProfileEvent{}
class NavigateBackToProfilEvent extends ProfileEvent{}
