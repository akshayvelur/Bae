part of 'profile_bloc.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {
  
}
class IninitState extends ProfileState{
  final UserModel user;
  IninitState({required this.user});
}
class NavigateToUserDataState extends ProfileState{}
