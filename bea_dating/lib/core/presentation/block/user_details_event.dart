part of 'user_details_bloc.dart';

@immutable
abstract class UserDetailsEvent {}

class SplashToWelcomeEvent extends UserDetailsEvent{}
class WelcomeToRulePageEvent extends UserDetailsEvent{}
class RuleToNameformEvent extends UserDetailsEvent{}