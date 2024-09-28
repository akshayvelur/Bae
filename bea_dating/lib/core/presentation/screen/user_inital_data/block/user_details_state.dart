part of 'user_details_bloc.dart';

@immutable
abstract class UserDetailsState {
  final String username;
  final String dob;
  final String location;
  final String gender;
  final String genderInterest;
  final String expectation;
  final List<XFile>image;
  UserDetailsState(
      {required this.username,
      required this.dob,
      required this.location,
      required this.gender,
      required this.genderInterest,
      required this.expectation,required this.image});
}

class UserDetailsInitial extends UserDetailsState {
  UserDetailsInitial(
      {required super.username,
      required super.dob,
      required super.location,
      required super.gender,
      required super.genderInterest,
      required super.expectation,required super.image});
}

class InitLodingSate extends UserDetailsState {
  InitLodingSate(
      {required super.username,
      required super.dob,
      required super.location,
      required super.gender,
      required super.genderInterest,
      required super.expectation, required super.image});
}

class NavigationToWelcomscreenState extends UserDetailsState {
  NavigationToWelcomscreenState(
      {required super.username,
      required super.dob,
      required super.location,
      required super.gender,
      required super.genderInterest,
      required super.expectation, required super.image});
}

class AccountVarifiedState extends UserDetailsState {
  AccountVarifiedState(
      {required super.username,
      required super.dob,
      required super.location,
      required super.gender,
      required super.genderInterest,
      required super.expectation, required super.image});
}

class NavigationToRuleState extends UserDetailsState {
  NavigationToRuleState(
      {required super.username,
      required super.dob,
      required super.location,
      required super.gender,
      required super.genderInterest,
      required super.expectation, required super.image});
}

class NavigateToNameFormState extends UserDetailsState {
  NavigateToNameFormState(
      {required super.username,
      required super.dob,
      required super.location,
      required super.gender,
      required super.genderInterest,
      required super.expectation, required super.image});
}

class NavigateToDobState extends UserDetailsState {
  NavigateToDobState(
      {required super.username,
      required super.dob,
      required super.location,
      required super.gender,
      required super.genderInterest,
      required super.expectation, required super.image});
}

class NavigateToEnableLocationState extends UserDetailsState {
  NavigateToEnableLocationState(
      {required super.username,
      required super.dob,
      required super.location,
      required super.gender,
      required super.genderInterest,
      required super.expectation, required super.image});
}

class NavigateToGenderSelectionState extends UserDetailsState {
  NavigateToGenderSelectionState(
      {required super.username,
      required super.dob,
      required super.location,
      required super.gender,
      required super.genderInterest,
      required super.expectation, required super.image});
}

class GenderColorSelectedState extends UserDetailsState {
  final menclr;
  final womenclr;
  final Otherclr;

  GenderColorSelectedState(
      {required this.menclr,
      required this.Otherclr,
      required this.womenclr,
      required super.username,
      required super.dob,
      required super.location,
      required super.genderInterest,
      required super.expectation,
      required super.gender, required super.image});
}

class InterestColorSelectedState extends UserDetailsState {
  final menclr;
  final womenclr;
  final everyoneclr;

  InterestColorSelectedState(
      {required this.menclr,
      required this.everyoneclr,
      required this.womenclr,
      required super.username,
      required super.dob,
      required super.location,
      required super.genderInterest,
      required super.expectation,
      required super.gender, required super.image});
}

class NavigateToGenderInterestedState extends UserDetailsState {
  NavigateToGenderInterestedState(
      {required super.username,
      required super.dob,
      required super.location,
      required super.gender,
      required super.genderInterest,
      required super.expectation, required super.image});
}

class NavigateToExpectationState extends UserDetailsState {
  NavigateToExpectationState(
      {required super.username,
      required super.dob,
      required super.location,
      required super.gender,
      required super.genderInterest,
      required super.expectation, required super.image});
}

class ExpectationColorSelectedState extends UserDetailsState {
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

  ExpectationColorSelectedState(
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
      required super.username,
      required super.dob,
      required super.location,
      required super.gender,
      required super.genderInterest,
      required super.expectation, required super.image});
}

class NavigateToPresentationState extends UserDetailsState {
  NavigateToPresentationState(
      {required super.username,
      required super.dob,
      required super.location,
      required super.gender,
      required super.genderInterest,
      required super.expectation, required super.image});
}
class ImageSelectedSatate extends UserDetailsState{

  ImageSelectedSatate({required super.username, required super.dob, required super.location, required super.gender, required super.genderInterest, required super.expectation, required super.image});
}

class ImageDeletedSatate extends UserDetailsState{

  ImageDeletedSatate({required super.username, required super.dob, required super.location, required super.gender, required super.genderInterest, required super.expectation, required super.image});
}
class NavigateToHomeScreenState extends UserDetailsState {
  NavigateToHomeScreenState(
      {required super.username,
      required super.dob,
      required super.location,
      required super.gender,
      required super.genderInterest,
      required super.expectation, required super.image});
}
class PresentationPageLoading extends UserDetailsState{
  PresentationPageLoading({required super.username, required super.dob, required super.location, required super.gender, required super.genderInterest, required super.expectation, required super.image});
}
