part of 'profile_bloc.dart';

@immutable
abstract class ProfileEvent {}
class InitStateEvent extends ProfileEvent{
  // final UserModel user;
  // InitStateEvent({required this.user});
}

class NavigateToUserDataEvent extends ProfileEvent{}
class NavigateBackToProfilEvent extends ProfileEvent{}
class ProImageUploadingEvent extends ProfileEvent{}
class ProfilePhotoDetetingEvent extends ProfileEvent{
  final String deleteId;

  ProfilePhotoDetetingEvent({required this.deleteId});
}

