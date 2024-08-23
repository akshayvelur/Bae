
part of 'user_details_bloc.dart';

@immutable
abstract class UserDetailsState {}

class UserDetailsInitial extends UserDetailsState {}
class NavigationToWelcomscreen extends UserDetailsState{}
class NavigationToRuleState extends UserDetailsState{}
class NavigateToNameFormState extends UserDetailsState{}
class NavigateToDobState extends UserDetailsState{}
class NavigateToEnableLocationState extends UserDetailsState{}
class NavigateToGenderSelectionState extends UserDetailsState{} 
class GenderColorSelectedState extends UserDetailsState{
   final menclr;
  final womenclr;
  final Otherclr;
  GenderColorSelectedState({required this.menclr,required this.Otherclr,required this.womenclr});
}
