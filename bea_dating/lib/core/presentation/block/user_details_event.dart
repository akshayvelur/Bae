part of 'user_details_bloc.dart';

@immutable
abstract class UserDetailsEvent {}

class SplashToWelcomeEvent extends UserDetailsEvent{}
class WelcomeToRulePageEvent extends UserDetailsEvent{}
class RuleToNameformEvent extends UserDetailsEvent{}
class NameToDobEvent extends UserDetailsEvent{}
class DobToEnableLocationEvent extends UserDetailsEvent{}
class EnableLocationToGenderselectEvent extends UserDetailsEvent{}
class GenderButtonSelctionEvent extends UserDetailsEvent{
  final menclr;
  final womenclr;
  final Otherclr;
  GenderButtonSelctionEvent({required this.menclr,required this.Otherclr,required this.womenclr});
}

