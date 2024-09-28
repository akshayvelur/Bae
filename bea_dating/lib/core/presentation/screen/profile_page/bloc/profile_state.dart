part of 'profile_bloc.dart';

@immutable
abstract class ProfileState {
    final UserModel ?user;
    final String ?interest;
    ProfileState ({required this.user,required this.interest});
}
abstract class ProfileActionState extends ProfileState{
  ProfileActionState({required super.user, required super.interest});
}
class ProfileInitial extends ProfileState {
  ProfileInitial({required super.user, required super.interest});
  
}
class IninitState extends ProfileState{
  IninitState({required super.user, required super.interest});

  
}
class LoadingState extends ProfileState{
  LoadingState({required super.user, required super.interest});
}
class LoadingSuccessState extends ProfileActionState{
  LoadingSuccessState({required super.user, required super.interest});
}
class NavigateToUserDataState extends ProfileState{
  NavigateToUserDataState({required super.user, required super.interest});
}
class NavigateBacktoProfileState extends ProfileState{
  NavigateBacktoProfileState({required super.user, required super.interest});
}
class ProfileInterestSelectedState extends ProfileState{
  ProfileInterestSelectedState({required super.user, required super.interest});
}
