// ignore_for_file: unused_local_variable

import 'dart:async';
import 'dart:developer';

import 'package:bea_dating/core/data/data_source/userdata.dart';
import 'package:bea_dating/core/data/model/usermodel.dart';
import 'package:bea_dating/core/domin/usecase/authentication.dart';
import 'package:bea_dating/core/data/data_source/like_user.dart';
import 'package:bea_dating/core/domin/usecase/viewed_account.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'homebloc_event.dart';
part 'homebloc_state.dart';

class HomeblocBloc extends Bloc<HomeblocEvent, HomeblocState> {
  HomeblocBloc() : super(HomeblocInitial()){
 on<BottoNavigatorEindexEvent>(bottoNavigatorEindexEvent);
 on<CountEvent>(countEvent);
 on<NumberOfUserEvent>(numberOfUserEvent);
 on<InitEvent>(initEvent);
 on<UserLikeEvent>(userLikeEvent);
 on<ViewAccountEvent>(viewAccountEvent);
 on<ProfileViewInitEvent>(profileViewInitEvent);
  }


  FutureOr<void> bottoNavigatorEindexEvent(BottoNavigatorEindexEvent event, Emitter<HomeblocState> emit) {
    emit(BottomNavigatorEindexState(Eindex: event.Eindex));
  }

  

  FutureOr<void> countEvent(CountEvent event, Emitter<HomeblocState> emit) {
    print(event.count);
    emit(CountUpdatestate(count:event.count));
  }

  FutureOr<void> numberOfUserEvent(NumberOfUserEvent event, Emitter<HomeblocState> emit) {
    emit(NumberOfUserSelectedState(numberOfUser: event.numberOfUser));
  }

  FutureOr<void> initEvent(InitEvent event, Emitter<HomeblocState> emit)async {
    Authentic authentic=Authentic();
  final vp=  await authentic.userUidFromSharedpref();
//   String g=vp.toString();
// log("quuuuu${vp.runtimeType}");
    emit(InitState(uid:vp ));
  }

  FutureOr<void> userLikeEvent(UserLikeEvent event, Emitter<HomeblocState> emit) async{
   
  

    print("State current user id ${event.likeduser}");
   liketoUser(event.likeduser!);
  }

  FutureOr<void> viewAccountEvent(ViewAccountEvent event, Emitter<HomeblocState> emit) {
    emit(ViewAccountState(uid: event.uid));
  }

  FutureOr<void> profileViewInitEvent(ProfileViewInitEvent event, Emitter<HomeblocState> emit)async {
    FirebaseAuth _ath=FirebaseAuth.instance;
    if(event.uid.toString()!=_ath.currentUser!.uid.toString()){
    viewedUser(event.uid);
    }
        try{
     // emit(LoadingState(user: state.user));
    UserData userData = UserData();
    UserModel? user = await userData.viewProfile(event.uid);
    if (user != null) {
       print("profile data fetched");
     
   
      emit(ProfileViewInitState(user: user));
     emit(ProfileLoadingSuccessState(user:user));

    } else {
       print("NO DATA");
    }
  }catch(e){
    print("userinit error${e}");
  }
  }
}
