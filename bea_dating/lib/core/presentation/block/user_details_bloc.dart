import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
part 'user_details_event.dart';
part 'user_details_state.dart';

class UserDetailsBloc extends Bloc<UserDetailsEvent, UserDetailsState> {
  UserDetailsBloc() : super(UserDetailsInitial()) {
    on<SplashToWelcomeEvent>(splashToWelcomeEvent);
    on<WelcomeToRulePageEvent>(welcomeToRulePageEvent);
    on<RuleToNameformEvent>(ruleToNameformEvent);
    on<NameToDobEvent>(nameToDobEvent);
    on<DobToEnableLocationEvent>(dobToEnableLocationEvent);
    on<EnableLocationToGenderselectEvent>(enableLocationToGenderselct);
    on<GenderButtonSelctionEvent>(genderButtonSelctionEvent);
    on<GenderSelectToGenderInterestEvent>(genderSelectToGenderInterestEvent);
    on<InterestToExpectationEvent>(interestToExpectationEvent);
    on<ExpectationtButtonSelectionEvent>(expectationtButtonSelectionEvent);
    on<ExeptationToPresentationEvent>(exeptationToPresentationEvent);
  }

  FutureOr<void> splashToWelcomeEvent(
      SplashToWelcomeEvent event, Emitter<UserDetailsState> emit) async {
    print("navigate to welcome");
    await Future.delayed(Duration(seconds: 2));
    emit(NavigationToWelcomscreen());
  }

  FutureOr<void> welcomeToRulePageEvent(
      WelcomeToRulePageEvent event, Emitter<UserDetailsState> emit) {
    emit(NavigationToRuleState());
    print("navigate to Rule");
  }

  FutureOr<void> ruleToNameformEvent(
      RuleToNameformEvent event, Emitter<UserDetailsState> emit) async {
    emit(NavigateToNameFormState());
  }

  FutureOr<void> nameToDobEvent(
      NameToDobEvent event, Emitter<UserDetailsState> emit) {
    emit(NavigateToDobState());
    print('navigate to Dob');
  }

  FutureOr<void> dobToEnableLocationEvent(
      DobToEnableLocationEvent event, Emitter<UserDetailsState> emit) {
    emit(NavigateToEnableLocationState());
  }

  FutureOr<void> enableLocationToGenderselct(
      EnableLocationToGenderselectEvent event, Emitter<UserDetailsState> emit) {
    emit(NavigateToGenderSelectionState());
  }

  FutureOr<void> genderButtonSelctionEvent(
      GenderButtonSelctionEvent event, Emitter<UserDetailsState> emit) {
    emit(GenderColorSelectedState(
        menclr: event.menclr,
        Otherclr: event.Otherclr,
        womenclr: event.womenclr,
        gender: event.gender));
    //log("colorchaged");
  }

  FutureOr<void> genderSelectToGenderInterestEvent(
      GenderSelectToGenderInterestEvent event, Emitter<UserDetailsState> emit) {
    print("intrest");
    emit(NavigateToGenderInterestedState());
  }

  FutureOr<void> interestToExpectationEvent(
      InterestToExpectationEvent event, Emitter<UserDetailsState> emit) {
    emit(NavigateToExpectationState());
  }

  FutureOr<void> expectationtButtonSelectionEvent(
      ExpectationtButtonSelectionEvent event, Emitter<UserDetailsState> emit) {
    emit(ExpectationColorSelectedState(
        boxOne: event.boxOne,
        boxTwo: event.boxTwo,
        boxThree: event.boxThree,
        boxFour: event.boxFour,
        boxFive: event.boxFive,
        effectbOne: event.effectbOne,
        effectbTwo: event.effectbTwo,
        effectbThree: event.effectbThree,
        effectbFour: event.effectbFour,
        effectbFive: event.effectbFive,
        expetation: event.expectation));
  }

  FutureOr<void> exeptationToPresentationEvent(ExeptationToPresentationEvent event, Emitter<UserDetailsState> emit) {
 emit(NavigateToPresentation());
  }
}
