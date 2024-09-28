part of 'user_details_bloc.dart';

@immutable
abstract class UserDetailsEvent {}

class SplashToWelcomeEvent extends UserDetailsEvent {}

class AlreadyExistsuserEvent extends UserDetailsEvent {}

class GoogleLoginEvent extends UserDetailsEvent {}


class RuleToNameformEvent extends UserDetailsEvent {}

class NameToDobEvent extends UserDetailsEvent {
  final userName;
  NameToDobEvent({required this.userName});
}

class DobToEnableLocationEvent extends UserDetailsEvent {
  final String dob;
  DobToEnableLocationEvent({required this.dob});
}

class EnableLocationToGenderselectEvent extends UserDetailsEvent {

}

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

class InterestButtonSelctionEvent extends UserDetailsEvent {
  final menclr;
  final womenclr;
  final Otherclr;
  final gender;
  InterestButtonSelctionEvent(
      {required this.menclr,
      required this.Otherclr,
      required this.womenclr,
      required this.gender});
}

class GenderSelectToGenderInterestEvent extends UserDetailsEvent {
  final String gender;
  GenderSelectToGenderInterestEvent({required this.gender});
}

class InterestToExpectationEvent extends UserDetailsEvent {
  final String interest;
  InterestToExpectationEvent({required this.interest});
}

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
      required this.effectbFive,
      required this.expectation});
}

class ExeptationToPresentationEvent extends UserDetailsEvent {
  final String expectation;
  ExeptationToPresentationEvent({required this.expectation});
}
class ImageAddingEvent extends UserDetailsEvent{
final  List<XFile>image;

  ImageAddingEvent({required this.image});
}
class ImageDeletionEvent extends UserDetailsEvent{
  final List<XFile>image;
  final index;

  ImageDeletionEvent({required this.image,required this.index});
}
class PresentationToHomeScreenEvent extends UserDetailsEvent {}

