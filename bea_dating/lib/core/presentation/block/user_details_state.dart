
part of 'user_details_bloc.dart';

@immutable
abstract class UserDetailsState {}

class UserDetailsInitial extends UserDetailsState {}
class InitLodingSate extends UserDetailsState{}
class NavigationToWelcomscreenState extends UserDetailsState{}
class AccountVarifiedState extends UserDetailsState{
}
class NavigationToRuleState extends UserDetailsState{}
class NavigateToNameFormState extends UserDetailsState{}
class NavigateToDobState extends UserDetailsState{}
class NavigateToEnableLocationState extends UserDetailsState{}
class NavigateToGenderSelectionState extends UserDetailsState{} 
class GenderColorSelectedState extends UserDetailsState{
   final menclr;
  final womenclr;
  final Otherclr;
  final gender;
  GenderColorSelectedState({required this.menclr,required this.Otherclr,required this.womenclr,required this. gender});
}
class NavigateToGenderInterestedState extends UserDetailsState{}
class NavigateToExpectationState extends UserDetailsState{}
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
  final expetation;
  ExpectationColorSelectedState(
      {required this.boxOne,
      required this.boxTwo,
      required this.boxThree,
      required this.boxFour,
      required this.boxFive, required this.effectbOne,
      required this.effectbTwo,
      required this.effectbThree,
      required this.effectbFour,
      required this.effectbFive,required this.expetation});
}
class NavigateToPresentationState extends UserDetailsState{}
class NavigateToHomeScreenState extends UserDetailsState{}

