// ignore_for_file: unnecessary_null_comparison
import 'package:bea_dating/core/domin/usecase/image_upload.dart';
import 'dart:async';
import 'dart:developer';
import 'package:bea_dating/core/domin/usecase/authentication.dart';
import 'package:bea_dating/core/domin/usecase/location_Enable.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';
import 'package:location/location.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'user_details_event.dart';
part 'user_details_state.dart';

class UserDetailsBloc extends Bloc<UserDetailsEvent, UserDetailsState> {
  UserDetailsBloc()
      : super(UserDetailsInitial(
            username: '',
            dob: '',
            location: null,
            gender: '',
            genderInterest: '',
            expectation: '',
            image: [])) {
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
    on<ImageAddingEvent>(imageAddingEvent);
    on<ImageDeletionEvent>(imageDeletionEvent);
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
          expectation: state.expectation,
          image: state.image));
    } else {
      //new user
      print("navigate to welcome");
      emit(NavigationToWelcomscreenState(
          username: state.username,
          dob: state.dob,
          location: state.location,
          gender: state.gender,
          genderInterest: state.genderInterest,
          expectation: state.expectation,
          image: state.image));
    }
  }

  //Google Login
  FutureOr<void> googleLoginEvent(
      GoogleLoginEvent event, Emitter<UserDetailsState> emit) async {

        
    Authentic _authentic = Authentic();

     await GoogleSignIn().signOut();
     
    UserCredential usercredential= await _authentic.signInWithGoogle();
    if(usercredential.user!=null){
        emit(InitLodingSate(
        username: state.username,
        dob: state.dob,
        location: state.location,
        gender: state.gender,
        genderInterest: state.genderInterest,
        expectation: state.expectation,
        image: state.image));
    
    print("my out");
   bool out =  await _authentic.UserExitOrNot();
    if (out == true) {
      emit(NavigateToHomeScreenState(
          username: state.username,
          dob: state.dob,
          location: state.location,
          gender: state.gender,
          genderInterest: state.genderInterest,
          expectation: state.expectation,
          image: state.image));
    } else {
      emit(NavigationToRuleState(
          username: state.username,
          dob: state.dob,
          location: state.location,
          gender: state.gender,
          genderInterest: state.genderInterest,
          expectation: state.expectation,
          image: state.image));
    }
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
        expectation: state.expectation,
        image: state.image));
  }

  FutureOr<void> ruleToNameformEvent(
      RuleToNameformEvent event, Emitter<UserDetailsState> emit) async {
    emit(NavigateToNameFormState(
        username: state.username,
        dob: state.dob,
        location: state.location,
        gender: state.gender,
        genderInterest: state.genderInterest,
        expectation: state.expectation,
        image: state.image));
  }

  FutureOr<void> nameToDobEvent(
      NameToDobEvent event, Emitter<UserDetailsState> emit) {
    emit(NavigateToDobState(
        username: event.userName,
        dob: state.dob,
        location: state.location,
        gender: state.gender,
        genderInterest: state.genderInterest,
        expectation: state.expectation,
        image: state.image));
    print('navigate to Dob');
  }

  FutureOr<void> dobToEnableLocationEvent(
      DobToEnableLocationEvent event, Emitter<UserDetailsState> emit) async{
 SharedPreferences pref=await SharedPreferences.getInstance();
 Map<String,String>location={};
  
  String ?lati=await pref.getString('latitude');
  String? longi=await pref.getString('longitude');

  if(lati==null&&longi==null){
    print("enable location");
   emit(NavigateToEnableLocationState(
        username: state.username,
        dob: event.dob,
        location: state.location,
        gender: state.gender,
        genderInterest: state.genderInterest,
        expectation: state.expectation,
        image: state.image));
  }else{
      location['longitude']=longi!;
        location['latitude']=lati!;
        log(' add to map${location}');
  }
if(location.containsKey("longitude")&&location.containsKey("latitude")){
  print("to gender");
      emit(NavigateToGenderSelectionState(
        username: state.username,
        dob: event.dob,
        location: location,
        gender: state.gender,
        genderInterest: state.genderInterest,
        expectation: state.expectation,
        image: state.image));
}
  }

  FutureOr<void> enableLocationToGenderselct(
      EnableLocationToGenderselectEvent event,
      Emitter<UserDetailsState> emit) async {
  Map<String,String>location={};
     location = await locationEnable();
  if(location.isNotEmpty){
    emit(NavigateToGenderSelectionState(
        username: state.username,
        dob: state.dob,
        location: location,
        gender: state.gender,
        genderInterest: state.genderInterest,
        expectation: state.expectation,
        image: state.image));
        print(location);
              await locationToSharedPref(longitude:location['longitude']! , latitude: location['latitude']!);
  }
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
        expectation: state.expectation,
        image: state.image));
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
        expectation: state.expectation,
        image: state.image));
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
        expectation: state.expectation,
        image: state.image));
  }

  FutureOr<void> interestToExpectationEvent(
      InterestToExpectationEvent event, Emitter<UserDetailsState> emit) {
    emit(NavigateToExpectationState(
        username: state.username,
        dob: state.dob,
        location: state.location,
        gender: state.gender,
        genderInterest: event.interest,
        expectation: state.expectation,
        image: state.image));
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
        expectation: event.expectation,
        image: state.image));
  }

  FutureOr<void> exeptationToPresentationEvent(
      ExeptationToPresentationEvent event, Emitter<UserDetailsState> emit) {
    emit(NavigateToPresentationState(
        username: state.username,
        dob: state.dob,
        location: state.location,
        gender: state.gender,
        genderInterest: state.genderInterest,
        expectation: state.expectation,
        image: state.image));
  }

  //  image adding...
  FutureOr<void> imageAddingEvent(
      ImageAddingEvent event, Emitter<UserDetailsState> emit) async {
    int maximageLimit = 4;
    print("pick image");
    try {
      final List<XFile>? img = await ImagePicker().pickMultiImage();
      if (img!.isNotEmpty && img.length + event.image.length <= maximageLimit) {
        event.image.addAll(img);
        emit(ImageSelectedSatate(
            username: state.username,
            dob: state.dob,
            location: state.location,
            gender: state.gender,
            genderInterest: state.genderInterest,
            expectation: state.expectation,
            image: event.image));
        print(event.image.length);
      } else {}
    } catch (e) {log("image adding${e}");}
    print(event.image.length);
    emit(ImageSelectedSatate(
        username: state.username,
        dob: state.dob,
        location: state.location,
        gender: state.gender,
        genderInterest: state.genderInterest,
        expectation: state.expectation,
        image: event.image));
  }

  // image deletion
  FutureOr<void> imageDeletionEvent(
      ImageDeletionEvent event, Emitter<UserDetailsState> emit) {
    event.image.removeAt(event.index);
    emit(ImageDeletedSatate(
        username: state.username,
        dob: state.dob,
        location: state.location,
        gender: state.gender,
        genderInterest: state.genderInterest,
        expectation: state.expectation,
        image: event.image));
    print(event.image.length);
  }

  FutureOr<void> presentationToHomeScreenEvent(
      PresentationToHomeScreenEvent event,
      Emitter<UserDetailsState> emit) async {
        emit(PresentationPageLoading(    username: state.username,
        dob: state.dob,
        location: state.location,
        gender: state.gender,
        genderInterest: state.genderInterest,
        expectation: state.expectation,
        image: state.image));
        print("presentation to home..");
            List<String> _imgUrl = [];
    if (state.image.length >= 2) {
      //Authentification
      Authentic _authentic = Authentic();
  
      try {
        
        for (int i = 0; i < state.image.length; i++) {
          // image storing to fire base
          _imgUrl.add(await uploadImage(
              "profileimage", await state.image[i].readAsBytes()));
        }
        log(_imgUrl.toString());
      } catch (e) {
        log("IMAGE UPLOAD ISSUE${e.toString()}");
      }
      // User data updating
      await _authentic.createUser(state.username, state.dob, state.location!,
          state.gender, state.genderInterest, state.expectation,);
      await _authentic.localStorage();
      await _authentic.imageCollectionUpdate(_imgUrl);
      log("datasubmitted");

      emit(NavigateToHomeScreenState(
          username: state.username,
          dob: state.dob,
          location: state.location,
          gender: state.gender,
          genderInterest: state.genderInterest,
          expectation: state.expectation,
          image: state.image));
    } else {
      //if you want to add validation add here
    }
  }
}
