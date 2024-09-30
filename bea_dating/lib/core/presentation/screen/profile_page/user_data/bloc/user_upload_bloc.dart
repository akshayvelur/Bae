import 'dart:async';

import 'package:bea_dating/core/domin/usecase/profile_data.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'user_upload_event.dart';
part 'user_upload_state.dart';

class UserUploadBloc extends Bloc<UserUploadEvent, UserUploadState> {
  UserUploadBloc() : super(UserUploadInitial(interest: '', about: '', relationship: '',reindex:null, heights: null, drink: '', gym: '', smoke: '')) {
on<UserLoadingEvent>(userLoadingEvent);
on<UserInterestAddingEvent>(userInterestAddingEvent);
on<UserAboutAddingEvent>(userAboutAddingEvent);
on<RelationshipSelectEvent>(relationshipSelectEvent);
on<HeightSelectingEvent>(heightSelectingEvent);
on< DrinkSelectEvent>( drinkSelectEvent);
on<GymSelectEvent>(gymSelectEvent);
on<SmokeSelectEvent>(smokeSelectEvent);
on< UserBackDataUpload>(userBackDataUpload);
  }
  
  FutureOr<void> userLoadingEvent(UserLoadingEvent event, Emitter<UserUploadState> emit) {
    emit(UserLoadingSuccessState(interest: state.interest, about: state.about, relationship:state.relationship, reindex: state.reindex, heights: state.heights,drink: state.drink,gym: state.gym,smoke: state.smoke));
  }
  FutureOr<void> userInterestAddingEvent(UserInterestAddingEvent event, Emitter<UserUploadState> emit) {
 emit(UserInterestSelectedState(interest: event.interest, about: state.about, relationship:state.relationship,reindex: state.reindex, heights: state.heights,drink: state.drink,gym: state.gym,smoke: state.smoke));
// print("hii");
 emit(UserLoadingSuccessState(interest: event.interest, about:state. about, relationship:state.relationship,reindex: state.reindex,heights: state.heights,drink: state.drink,gym: state.gym,smoke: state.smoke));
  }

  FutureOr<void> userAboutAddingEvent(UserAboutAddingEvent event, Emitter<UserUploadState> emit) {
  }
  FutureOr<void> relationshipSelectEvent(RelationshipSelectEvent event, Emitter<UserUploadState> emit) {
    print(event.relationship);
 emit(RelationshipSelectedState(interest: state.interest, about: state.about, relationship: event.relationship,reindex: event.indext,heights: state.heights,drink: state.drink,gym: state.gym,smoke: state.smoke)) ; 
emit(UserLoadingSuccessState(interest: state.interest, about: state.about, relationship: event.relationship,reindex: event.indext,heights: state.heights,drink: state.drink,gym: state.gym,smoke: state.smoke));
}

  FutureOr<void> heightSelectingEvent(HeightSelectingEvent event, Emitter<UserUploadState> emit) {
    emit(HeightSelectedState(interest: state.interest, about: state.about, relationship: state.relationship,reindex: state.reindex,heights:event.heights,drink: state.drink,gym: state.gym,smoke: state.smoke));
    emit(UserLoadingSuccessState(interest: state.interest, about: state.about, relationship: state.relationship,reindex: state.reindex,heights: state.heights,drink: state.drink,gym: state.gym,smoke: state.smoke));
  }

  FutureOr<void> drinkSelectEvent(DrinkSelectEvent event, Emitter<UserUploadState> emit) {
  
;    emit(DrinkSelectedState(interest: state.interest, about: state.about, relationship: state.relationship,reindex: state.reindex,heights: state.heights,drink: event.drink,index: event.indext,gym: state.gym,smoke: state.smoke));
  emit(UserLoadingSuccessState(interest: state.interest, about: state.about, relationship: state.relationship,reindex: state.reindex,heights: state.heights,drink: state.drink,gym: state.gym,smoke: state.smoke));
 }

  FutureOr<void> gymSelectEvent(GymSelectEvent event, Emitter<UserUploadState> emit) {
     emit(GymSelectedState(interest: state.interest, about: state.about, relationship: state.relationship,reindex: state.reindex,heights: state.heights,drink:state.drink,gym: event.gym,gymindex: event.gymindext,smoke: state.smoke));
  emit(UserLoadingSuccessState(interest: state.interest, about: state.about, relationship: state.relationship,reindex: state.reindex,heights: state.heights,drink: state.drink,gym: state.gym,smoke: state.smoke));
  }

  FutureOr<void> smokeSelectEvent(SmokeSelectEvent event, Emitter<UserUploadState> emit) {
     emit(SmokeSelectedState(interest: state.interest, about: state.about, relationship: state.relationship,reindex: state.reindex,heights: state.heights,drink:state.drink,gym: state.gym,smoke: event.smoke,smokeindex: event.smokeindext));
  emit(UserLoadingSuccessState(interest: state.interest, about: state.about, relationship: state.relationship,reindex: state.reindex,heights: state.heights,drink: state.drink,gym: state.gym,smoke: state.smoke));
  }

  FutureOr<void> userBackDataUpload(UserBackDataUpload event, Emitter<UserUploadState> emit)async {
    print(state.drink);
    Map<String,dynamic>data={};
  if(event.about.isNotEmpty) {data["about"]=event.about;}
   if(state.interest!.isNotEmpty) {  data["interest type"]=state.interest;}
   if(state.relationship!.isNotEmpty) {data["relationship"]=state.relationship;}
    if(state.heights!.isNotEmpty){data["height"]=state.heights;}
  if(state.drink!.isNotEmpty)  {data["drink"]=state.drink;}
  if(state.gym!.isNotEmpty){ data["gym"]=state.gym;}
    if(state.smoke!.isNotEmpty){data["smoke"]=state.smoke;}
    print(data);
    if(data.isNotEmpty){
    ProfileData profileData=ProfileData();
    await profileData.dataUpload(data);
    emit(UserBackDataSubmitted(interest: state.interest, about: state.about, relationship: state.relationship, reindex: state.reindex, heights:state.heights, drink:state.drink, gym:state.gym, smoke:state.smoke));
    }else{
        emit(UserBackDataSubmitted(interest: state.interest, about: state.about, relationship: state.relationship, reindex: state.reindex, heights:state.heights, drink:state.drink, gym:state.gym, smoke:state.smoke));
    }     
  }
}
