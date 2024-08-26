part of 'user_details_bloc.dart';

@immutable
abstract class UserDetailsEvent {}

class SplashToWelcomeEvent extends UserDetailsEvent {}

class WelcomeToRulePageEvent extends UserDetailsEvent {}

class RuleToNameformEvent extends UserDetailsEvent {}

class NameToDobEvent extends UserDetailsEvent {}

class DobToEnableLocationEvent extends UserDetailsEvent {}

class EnableLocationToGenderselectEvent extends UserDetailsEvent {}

class GenderButtonSelctionEvent extends UserDetailsEvent {
  final menclr;
  final womenclr;
  final Otherclr;
  final gender;
  GenderButtonSelctionEvent(
      {required this.menclr,
      required this.Otherclr,
      required this.womenclr,
      required this.gender});
}

class GenderSelectToGenderInterestEvent extends UserDetailsEvent {}

class InterestToExpectationEvent extends UserDetailsEvent {}

class ExpectationtButtonSelectionEvent extends UserDetailsEvent {
  final boxOne;
  final boxTwo;
  final boxThree;
  final boxFour;
  final boxFive;
  final effectbOne;
  final effectbTwo;
  final effectbThree;
  final effectbFour;
  final effectbFive;
  final expectation;
  ExpectationtButtonSelectionEvent(
      {required this.boxOne,
      required this.boxTwo,
      required this.boxThree,
      required this.boxFour,
      required this.boxFive,
      required this.effectbOne,
      required this.effectbTwo,
      required this.effectbThree,
      required this.effectbFour,
      required this.effectbFive,required this.expectation});
}
class ExeptationToPresentationEvent extends UserDetailsEvent{}