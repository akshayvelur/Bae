// ignore_for_file: unnecessary_null_comparison

import 'dart:async';
import 'dart:developer';
import 'package:bea_dating/core/domin/usecase/authentication.dart';
import 'package:bloc/bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'user_details_event.dart';
part 'user_details_state.dart';

class UserDetailsBloc extends Bloc<UserDetailsEvent, UserDetailsState> {
  UserDetailsBloc()
      : super(UserDetailsInitial(
            username: '',
            dob: '',
            location: '',
            gender: '',
            genderInterest: '',
            expectation: '')) {
    on<SplashToWelcomeEvent>(splashToWelcomeEvent);
    on<GoogleLoginEvent>(googleLoginEvent);
    on<AlreadyExistsuserEvent>(alreadyExistsuserEvent);
    on<RuleToNameformEvent>(ruleToNameformEvent);
    on<NameToDobEvent>(nameToDobEvent);
    on<DobToEnableLocationEvent>(dobToEnableLocationEvent);
    on<EnableLocationToGenderselectEvent>(enableLocationToGenderselct);
    on<GenderButtonSelctionEvent>(genderButtonSelctionEvent);
    on<InterestButtonSelctionEvent>(interestButtonSelctionEvent);
    on<GenderSelectToGenderInterestEvent>(genderSelectToGenderInterestEvent);
    on<InterestToExpectationEvent>(interestToExpectationEvent);
    on<ExpectationtButtonSelectionEvent>(expectationtButtonSelectionEvent);
    on<ExeptationToPresentationEvent>(exeptationToPresentationEvent);
    on<PresentationToHomeScreenEvent>(presentationToHomeScreenEvent);
  }

  FutureOr<void> splashToWelcomeEvent(
      SplashToWelcomeEvent event, Emitter<UserDetailsState> emit) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? Userfind = prefs.getString("email");
    await Future.delayed(Duration(seconds: 2));
    if (Userfind != null) {
      print("navigate to Homescreen");
      // Existing user
      emit(AccountVarifiedState(
          username: state.username,
          dob: state.dob,
          location: state.location,
          gender: state.gender,
          genderInterest: state.genderInterest,
          expectation: state.expectation));
    } else {
      //new user
      print("navigate to welcome");
      emit(NavigationToWelcomscreenState(
          username: state.username,
          dob: state.dob,
          location: state.location,
          gender: state.gender,
          genderInterest: state.genderInterest,
          expectation: state.expectation));
    }
  }

  //Google Login
  FutureOr<void> googleLoginEvent(
      GoogleLoginEvent event, Emitter<UserDetailsState> emit) async {
        await GoogleSignIn().signOut();
    Authentic _authentic = Authentic();
    await _authentic.signInWithGoogle();
    emit(InitLodingSate(
        username: state.username,
        dob: state.dob,
        location: state.location,
        gender: state.gender,
        genderInterest: state.genderInterest,
        expectation: state.expectation));
    print("my out");
    bool out = await _authentic.UserExitOrNot();
    if (out == true) {
        emit(NavigateToHomeScreenState(
          username: state.username,
          dob: state.dob,
          location: state.location,
          gender: state.gender,
          genderInterest: state.genderInterest,
          expectation: state.expectation));
    } else {
      emit(NavigationToRuleState(
          username: state.username,
          dob: state.dob,
          location: state.location,
          gender: state.gender,
          genderInterest: state.genderInterest,
          expectation: state.expectation));
    }
  }

//User Already Exist or Not checking event
  FutureOr<void> alreadyExistsuserEvent(
      AlreadyExistsuserEvent event, Emitter<UserDetailsState> emit) {
    emit(AccountVarifiedState(
        username: state.username,
        dob: state.dob,
        location: state.location,
        gender: state.gender,
        genderInterest: state.genderInterest,
        expectation: state.expectation));
  }

  FutureOr<void> ruleToNameformEvent(
      RuleToNameformEvent event, Emitter<UserDetailsState> emit) async {
    emit(NavigateToNameFormState(
        username: state.username,
        dob: state.dob,
        location: state.location,
        gender: state.gender,
        genderInterest: state.genderInterest,
        expectation: state.expectation));
  }

  FutureOr<void> nameToDobEvent(
      NameToDobEvent event, Emitter<UserDetailsState> emit) {
    emit(NavigateToDobState(
        username: event.userName,
        dob: state.dob,
        location: state.location,
        gender: state.gender,
        genderInterest: state.genderInterest,
        expectation: state.expectation));
    print('navigate to Dob');
  }

  FutureOr<void> dobToEnableLocationEvent(
      DobToEnableLocationEvent event, Emitter<UserDetailsState> emit) {
    emit(NavigateToEnableLocationState(
        username: state.username,
        dob: event.dob,
        location: state.location,
        gender: state.gender,
        genderInterest: state.genderInterest,
        expectation: state.expectation));
  }

  FutureOr<void> enableLocationToGenderselct(
      EnableLocationToGenderselectEvent event, Emitter<UserDetailsState> emit) {
    emit(NavigateToGenderSelectionState(
        username: state.username,
        dob: state.dob,
        location: event.location,
        gender: state.gender,
        genderInterest: state.genderInterest,
        expectation: state.expectation));
  }

  FutureOr<void> genderButtonSelctionEvent(
      GenderButtonSelctionEvent event, Emitter<UserDetailsState> emit) {
    print("gender");
    print(state.gender);
    emit(GenderColorSelectedState(
        menclr: event.menclr,
        Otherclr: event.Otherclr,
        womenclr: event.womenclr,
        username: state.username,
        dob: state.dob,
        location: state.location,
        gender: event.gender,
        genderInterest: state.genderInterest,
        expectation: state.expectation));
    //log("colorchaged");
  }

  FutureOr<void> interestButtonSelctionEvent(
      InterestButtonSelctionEvent event, Emitter<UserDetailsState> emit) {
    emit(InterestColorSelectedState(
        menclr: event.menclr,
        everyoneclr: event.Otherclr,
        womenclr: event.womenclr,
        username: state.username,
        dob: state.dob,
        location: state.location,
        gender: state.gender,
        genderInterest: event.gender,
        expectation: state.expectation));
  }

  FutureOr<void> genderSelectToGenderInterestEvent(
      GenderSelectToGenderInterestEvent event, Emitter<UserDetailsState> emit) {
    print("intrest");
    emit(NavigateToGenderInterestedState(
        username: state.username,
        dob: state.dob,
        location: state.location,
        gender: event.gender,
        genderInterest: state.genderInterest,
        expectation: state.expectation));
  }

  FutureOr<void> interestToExpectationEvent(
      InterestToExpectationEvent event, Emitter<UserDetailsState> emit) {
    emit(NavigateToExpectationState(
        username: state.username,
        dob: state.dob,
        location: state.location,
        gender: state.gender,
        genderInterest: event.interest,
        expectation: state.expectation));
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
        username: state.username,
        dob: state.dob,
        location: state.location,
        gender: state.gender,
        genderInterest: state.genderInterest,
        expectation: event.expectation));
  }

  FutureOr<void> exeptationToPresentationEvent(
      ExeptationToPresentationEvent event, Emitter<UserDetailsState> emit) {
    emit(NavigateToPresentationState(
        username: state.username,
        dob: state.dob,
        location: state.location,
        gender: state.gender,
        genderInterest: state.genderInterest,
        expectation: state.expectation));
  }

  FutureOr<void> presentationToHomeScreenEvent(
      PresentationToHomeScreenEvent event,
      Emitter<UserDetailsState> emit) async {
    Authentic _authentic = Authentic();
    await _authentic.createUser(state.username, state.dob, state.location,
        state.gender, state.genderInterest, state.expectation);
    await _authentic.localStorage();
    log("datasubmitted");

    emit(NavigateToHomeScreenState(
        username: state.username,
        dob: state.dob,
        location: state.location,
        gender: state.gender,
        genderInterest: state.genderInterest,
        expectation: state.expectation));
  }
}
