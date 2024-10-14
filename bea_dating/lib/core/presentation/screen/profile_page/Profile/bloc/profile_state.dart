part of 'profile_bloc.dart';

@immutable
abstract class ProfileState {
    final UserModel ?user;
    // final String ?interest;
    // final String ?about;
    ProfileState ( {required this.user,});
}
abstract class ProfileActionState extends ProfileState{
  ProfileActionState({required super.user});
}
class ProfileInitial extends ProfileState {
  ProfileInitial({required super.user});
  
}
class IninitState extends ProfileState{
  IninitState({required super.user});

  
}
class LoadingState extends ProfileState{
  LoadingState({required super.user});
}
class LoadingSuccessState extends ProfileActionState{
  LoadingSuccessState({required super.user});
}
class NavigateToUserDataState extends ProfileState{
  NavigateToUserDataState({required super.user});
}
class NavigateBacktoProfileState extends ProfileState{
  NavigateBacktoProfileState({required super.user});
}
class UserLoadingState extends ProfileState{
  UserLoadingState({required super.user});
}
