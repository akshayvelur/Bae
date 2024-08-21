part of 'user_details_bloc.dart';

@immutable
abstract class UserDetailsState {}

class UserDetailsInitial extends UserDetailsState {}
class NavigationToWelcomscreen extends UserDetailsState{}
class NavigationToRuleState extends UserDetailsState{}
class NavigateToNameFormState extends UserDetailsState{}