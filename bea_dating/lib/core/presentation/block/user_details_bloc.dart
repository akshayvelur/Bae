// ignore_for_file: unnecessary_null_comparison

import 'dart:async';
import 'dart:developer';
import 'package:bea_dating/core/domin/usecase/authentication.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'user_details_event.dart';
part 'user_details_state.dart';

class UserDetailsBloc extends Bloc<UserDetailsEvent, UserDetailsState> {
  UserDetailsBloc() : super(UserDetailsInitial()) {
    on<SplashToWelcomeEvent>(splashToWelcomeEvent);
    on<GoogleLoginEvent>(googleLoginEvent);
   on<AlreadyExistsuserEvent>(alreadyExistsuserEvent);
    on<RuleToNameformEvent>(ruleToNameformEvent);
    on<NameToDobEvent>(nameToDobEvent);
    on<DobToEnableLocationEvent>(dobToEnableLocationEvent);
    on<EnableLocationToGenderselectEvent>(enableLocationToGenderselct);
    on<GenderButtonSelctionEvent>(genderButtonSelctionEvent);
    on<GenderSelectToGenderInterestEvent>(genderSelectToGenderInterestEvent);
    on<InterestToExpectationEvent>(interestToExpectationEvent);
    on<ExpectationtButtonSelectionEvent>(expectationtButtonSelectionEvent);
    on<ExeptationToPresentationEvent>(exeptationToPresentationEvent);
    on<PresentationToHomeScreenEvent>(presentationToHomeScreenEvent);
  }

  FutureOr<void> splashToWelcomeEvent(
      SplashToWelcomeEvent event, Emitter<UserDetailsState> emit) async {
          SharedPreferences prefs=await SharedPreferences.getInstance();
         String? Userfind= prefs.getString("email");
           await Future.delayed(Duration(seconds: 2));
   if(Userfind!=null){
     print("navigate to Homescreen");
    // Existing user
    emit(AccountVarifiedState());
   }else{
    //new user 
    print("navigate to welcome");
    emit(NavigationToWelcomscreenState());}
   
  }


 
  //Google Login
  FutureOr<void> googleLoginEvent(
      GoogleLoginEvent event, Emitter<UserDetailsState> emit) async {
     
    Authentic _authentic = Authentic();
    await _authentic.signInWithGoogle();
    emit(InitLodingSate());
    print("my out");
   bool out = await _authentic.UserExitOrNot();
   if(out==true){
      emit(NavigateToHomeScreenState());
   }else{
    emit(NavigationToRuleState());
   }
  }
//User Already Exist or Not checking event 
FutureOr<void> alreadyExistsuserEvent(AlreadyExistsuserEvent event, Emitter<UserDetailsState> emit) {
  emit(AccountVarifiedState());
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

  FutureOr<void> exeptationToPresentationEvent(
      ExeptationToPresentationEvent event, Emitter<UserDetailsState> emit) {
    emit(NavigateToPresentationState());
  }

  FutureOr<void> presentationToHomeScreenEvent(PresentationToHomeScreenEvent event, Emitter<UserDetailsState> emit)async {
Authentic _authentic=Authentic();
await _authentic.createUser();
await _authentic.localStorage();
print("helooo");
emit(NavigateToHomeScreenState());  
}

 



  
}
