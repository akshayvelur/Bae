// ignore_for_file: unused_local_variable

import 'dart:async';
import 'dart:developer';
import 'package:bea_dating/core/data/constant/call_info.dart';
import 'package:bea_dating/core/data/data_source_getting/userdata.dart';
import 'package:bea_dating/core/data/distance_finding/distance_finding.dart';
import 'package:bea_dating/core/data/model/usermodel.dart';
import 'package:bea_dating/core/domin/usecase/authentication.dart';
import 'package:bea_dating/core/data/data_source_getting/like_user.dart';
import 'package:bea_dating/core/domin/usecase/viewed_account.dart';
import 'package:bea_dating/core/presentation/screen/profile_page/Profile/bloc/profile_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';
part 'homebloc_event.dart';
part 'homebloc_state.dart';

class HomeblocBloc extends Bloc<HomeblocEvent, HomeblocState> {
  HomeblocBloc() : super(HomeblocInitial()) {
    on<BottoNavigatorEindexEvent>(bottoNavigatorEindexEvent);
    on<CountEvent>(countEvent);
    on<NumberOfUserEvent>(numberOfUserEvent);
    on<InitEvent>(initEvent);
    on<UserLikeEvent>(userLikeEvent);
    on<ViewAccountEvent>(viewAccountEvent);
    on<ProfileViewInitEvent>(profileViewInitEvent);
    on<InitUserNameEvent>(initUserNameEvent);
    on<DistanceFilterEvent>(distanceFilterEvent);
  }

  FutureOr<void> bottoNavigatorEindexEvent(
      BottoNavigatorEindexEvent event, Emitter<HomeblocState> emit) {
    emit(BottomNavigatorEindexState(Eindex: event.Eindex));
  }

  FutureOr<void> countEvent(CountEvent event, Emitter<HomeblocState> emit) {
    print(event.count);
    emit(CountUpdatestate(count: event.count));
  }

  FutureOr<void> numberOfUserEvent(
      NumberOfUserEvent event, Emitter<HomeblocState> emit) {
    emit(NumberOfUserSelectedState(numberOfUser: event.numberOfUser));
  }

  FutureOr<void> initEvent(InitEvent event, Emitter<HomeblocState> emit) async {
    Authentic authentic = Authentic();
    final vp = await authentic.userUidFromSharedpref();
//   String g=vp.toString();
// log("quuuuu${vp.runtimeType}");
    emit(InitState(uid: vp));
  }

  FutureOr<void> userLikeEvent(
      UserLikeEvent event, Emitter<HomeblocState> emit) async {
    print("State current user id ${event.likeduser}");
    liketoUser(event.likeduser!);
  }

  FutureOr<void> viewAccountEvent(
      ViewAccountEvent event, Emitter<HomeblocState> emit) {
    emit(ViewAccountState(uid: event.uid));
  }

  FutureOr<void> profileViewInitEvent(
      ProfileViewInitEvent event, Emitter<HomeblocState> emit) async {
    FirebaseAuth _ath = FirebaseAuth.instance;
    log("again");
    log("again${event.uid}");
    if (event.uid.toString() != _ath.currentUser!.uid.toString()) {
      log("again${event.uid}");
      viewedUser(event.uid);
    }
    try {
      // emit(LoadingState(user: state.user));
      UserData userData = UserData();
      UserModel? user = await userData.viewProfile(event.uid);
      if (user != null) {
        print("profile data fetched");

        emit(ProfileViewInitState(user: user));
        emit(ProfileLoadingSuccessState(user: user));
      } else {
        print("NO DATA");
      }
    } catch (e) {
      print("userinit error${e}");
    }
  }

  FutureOr<void> initUserNameEvent(
      InitUserNameEvent event, Emitter<HomeblocState> emit) {
    String currentUserId = FirebaseAuth.instance.currentUser!.uid;

// Get the user's document reference
    DocumentReference userRef =
        FirebaseFirestore.instance.collection('users').doc(currentUserId);

// Fetch the user's data
    userRef.get().then((DocumentSnapshot snapshot) {
      if (snapshot.exists) {
        Map<String, dynamic>? userData =
            snapshot.data() as Map<String, dynamic>?;

        if (userData != null) {
          String userName = userData['name'];

          emit(InitUserNameState(userName: userName));

          // Use the retrieved name and age
        }
      }
    }).catchError((error) {
      print('Error getting user data: $error');
    });
    // FirebaseAuth _auth=FirebaseAuth.instance;
    // UserData userData=UserData();
    // String temp= userData.userNameFromFirebase();
    // log("MYYYYmessage${temp}");
  }

  FutureOr<void> distanceFilterEvent(
      DistanceFilterEvent event, Emitter<HomeblocState> emit) async{
    var filerdData=await getNearbyUsers(event.distance);
    //print("filterduser${filerdData}");
  emit(DistanceFilterState(mydata:filerdData));
  }
}
