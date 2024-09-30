import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'user_upload_event.dart';
part 'user_upload_state.dart';

class UserUploadBloc extends Bloc<UserUploadEvent, UserUploadState> {
  UserUploadBloc() : super(UserUploadInitial(interest: '', about: '', relationship: '',reindex:null, heights: null, drink: '')) {
on<UserLoadingEvent>(userLoadingEvent);
on<UserInterestAddingEvent>(userInterestAddingEvent);
on<UserAboutAddingEvent>(userAboutAddingEvent);
on<RelationshipSelectEvent>(relationshipSelectEvent);
on<HeightSelectingEvent>(heightSelectingEvent);
on< DrinkSelectEvent>( drinkSelectEvent);
  }
  
  FutureOr<void> userLoadingEvent(UserLoadingEvent event, Emitter<UserUploadState> emit) {
    emit(UserLoadingSuccessState(interest: state.interest, about: state.about, relationship:state.relationship, reindex: state.reindex, heights: state.heights,drink: state.drink));
  }
  FutureOr<void> userInterestAddingEvent(UserInterestAddingEvent event, Emitter<UserUploadState> emit) {
 emit(UserInterestSelectedState(interest: event.interest, about: state.about, relationship:state.relationship,reindex: state.reindex, heights: state.heights,drink: state.drink));
// print("hii");
 emit(UserLoadingSuccessState(interest: event.interest, about:state. about, relationship:state.relationship,reindex: state.reindex,heights: state.heights,drink: state.drink));
  }

  FutureOr<void> userAboutAddingEvent(UserAboutAddingEvent event, Emitter<UserUploadState> emit) {
  }
  FutureOr<void> relationshipSelectEvent(RelationshipSelectEvent event, Emitter<UserUploadState> emit) {
    print(event.relationship);
 emit(RelationshipSelectedState(interest: state.interest, about: state.about, relationship: event.relationship,reindex: event.indext,heights: state.heights,drink: state.drink)) ; 
emit(UserLoadingSuccessState(interest: state.interest, about: state.about, relationship: event.relationship,reindex: event.indext,heights: state.heights,drink: state.drink));
}

  FutureOr<void> heightSelectingEvent(HeightSelectingEvent event, Emitter<UserUploadState> emit) {
    emit(HeightSelectedState(interest: state.interest, about: state.about, relationship: state.relationship,reindex: state.reindex,heights:event.heights,drink: state.drink));
    emit(UserLoadingSuccessState(interest: state.interest, about: state.about, relationship: state.relationship,reindex: state.reindex,heights: state.heights,drink: state.drink));
  }

  FutureOr<void> drinkSelectEvent(DrinkSelectEvent event, Emitter<UserUploadState> emit) {
  
;    emit(DrinkSelectedState(interest: state.interest, about: state.about, relationship: state.relationship,reindex: state.reindex,heights: state.heights,drink: event.drink,index: event.indext));
  emit(UserLoadingSuccessState(interest: state.interest, about: state.about, relationship: state.relationship,reindex: state.reindex,heights: state.heights,drink: state.drink));
 }
}
