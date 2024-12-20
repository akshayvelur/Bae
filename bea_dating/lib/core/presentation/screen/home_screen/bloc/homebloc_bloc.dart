// ignore_for_file: unused_local_variable

import 'dart:async';
import 'dart:developer';
import 'package:bea_dating/core/data/constant/call_info.dart';
import 'package:bea_dating/core/data/data_source_getting/userdata.dart';
import 'package:bea_dating/core/data/data_uploading/discovery_upload.dart';
import 'package:bea_dating/core/data/distance_finding/distance_finding.dart';
import 'package:bea_dating/core/data/model/usermodel.dart';
import 'package:bea_dating/core/data/service/boost_service.dart';
import 'package:bea_dating/core/domin/usecase/authentication.dart';
import 'package:bea_dating/core/data/data_source_getting/like_user.dart';
import 'package:bea_dating/core/domin/usecase/viewed_account.dart';
import 'package:bea_dating/core/presentation/screen/profile_page/Profile/bloc/profile_bloc.dart';
import 'package:bea_dating/core/presentation/utilit/home_varriables.dart';
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
  HomeblocBloc()
      : super(HomeblocInitial(
            gender: null,
            index: null,
            age1: null,
            age2: null,
            distance: null)) {
    on<BottoNavigatorEindexEvent>(bottoNavigatorEindexEvent);
    on<CountEvent>(countEvent);
    on<NumberOfUserEvent>(numberOfUserEvent);
    on<InitEvent>(initEvent);
    on<UserLikeEvent>(userLikeEvent);
    on<ViewAccountEvent>(viewAccountEvent);
    on<ProfileViewInitEvent>(profileViewInitEvent);
    on<InitUserEvent>(initUserEvent);
    on<DistanceFilterEvent>(distanceFilterEvent);
    on<DistanceFilterSliderEvent>(distanceFilterSliderEvent);
    on<AgeFilterEvent>(ageFilterEvent);
    on<ShowmeEvent>(showmeEvent);
    on<DiscoverySubmissionEvent>(discoverySubmissionEvent);
    on<NavigateToDiacoveryEvent>(navigateToDiacoveryEvent);
    on<CurrentUserLikeEvent>(currentUserLikeEvent);
    on<LikeFromProfileEvent>(likeFromProfileEvent);
    on<UnfollowFromProfileEvent>(unfollowFromProfileEvent);
    on<FilterationEvent>(filterationEvent);
  }

  FutureOr<void> bottoNavigatorEindexEvent(
      BottoNavigatorEindexEvent event, Emitter<HomeblocState> emit) {
    emit(BottomNavigatorEindexState(
        Eindex: event.Eindex,
        gender: state.gender,
        index: state.index,
        age1: state.age1,
        age2: state.age2,
        distance: state.distance));
  }

  FutureOr<void> countEvent(CountEvent event, Emitter<HomeblocState> emit) {
    print(event.count);
    emit(CountUpdatestate(
        count: event.count,
        gender: state.gender,
        index: state.index,
        age1: state.age1,
        age2: state.age2,
        distance: state.distance));
  }

  FutureOr<void> numberOfUserEvent(
      NumberOfUserEvent event, Emitter<HomeblocState> emit) {
    emit(NumberOfUserSelectedState(
        numberOfUser: event.numberOfUser,
        gender: state.gender,
        index: state.index,
        age1: state.age1,
        age2: state.age2,
        distance: state.distance));
  }

  FutureOr<void> initEvent(InitEvent event, Emitter<HomeblocState> emit) async {
    Authentic authentic = Authentic();
    final vp = await authentic.userUidFromSharedpref();
//   String g=vp.toString();
// log("quuuuu${vp.runtimeType}");
    emit(InitState(
        uid: vp,
        gender: state.gender,
        index: state.index,
        age1: state.age1,
        age2: state.age2,
        distance: state.distance));
  }

  FutureOr<void> userLikeEvent(
      UserLikeEvent event, Emitter<HomeblocState> emit) async {
    print("State current user id ${event.likeduser}");
    liketoUser(event.likeduser!);
  }

  FutureOr<void> viewAccountEvent(
      ViewAccountEvent event, Emitter<HomeblocState> emit) {
    emit(ViewAccountState(
        uid: event.uid,
        gender: state.gender,
        index: state.index,
        age1: state.age1,
        age2: state.age2,
        distance: state.distance));
  }

  FutureOr<void> profileViewInitEvent(
      ProfileViewInitEvent event, Emitter<HomeblocState> emit) async {
    FirebaseAuth _ath = FirebaseAuth.instance;
    log("again");
    log("again${event.uid}");
    if (event.uid.toString() != _ath.currentUser!.uid.toString()) {
      log("again${event.uid}");

      if (event.uid != _ath.currentUser!.uid) {
        viewedUser(event.uid);
      }
    }
    try {
      // emit(LoadingState(user: state.user));
      UserData userData = UserData();
      UserModel? user = await userData.viewProfile(event.uid);
      if (user != null) {
        print("profile data fetched");
        await Future.delayed(Duration(microseconds: 1));

        emit(ProfileViewInitState(
            user: user,
            gender: state.gender,
            index: state.index,
            age1: state.age1,
            age2: state.age2,
            distance: state.distance));
        emit(ProfileLoadingSuccessState(
            user: user,
            gender: state.gender,
            index: state.index,
            age1: state.age1,
            age2: state.age2,
            distance: state.distance));
      } else {
        print("NO DATA");
      }
    } catch (e) {
      print("userinit error${e}");
    }
  }

  FutureOr<void> initUserEvent(
      InitUserEvent event, Emitter<HomeblocState> emit) async {
    String currentUserId = FirebaseAuth.instance.currentUser!.uid;

// Get the user's document reference
    try {
      DocumentReference userRef =
          FirebaseFirestore.instance.collection('users').doc(currentUserId);

// Fetch the user's data
      DocumentSnapshot snapshot = await userRef.get();
      if (snapshot.exists) {
        Map<String, dynamic>? userData =
            snapshot.data() as Map<String, dynamic>?;

        if (userData != null) {
          // String userName = userData['name'];
          final temp = userData;
          // Users distance filtering function
          print("filterduser${userData['maxDistance']}");
          add(DistanceFilterEvent(
              distance: double.parse(userData['maxDistance'])));

          emit(InitUserNameState(
              user: temp,
              gender: state.gender,
              index: state.index,
              age1: state.age1,
              age2: state.age2,
              distance: state.distance));

          // Use the retrieved name and age
        }
      }
    } catch (e) {
      log("home page current user fetching error${e}");
    }
  }

  FutureOr<void> distanceFilterEvent(
      DistanceFilterEvent event, Emitter<HomeblocState> emit) async {
    try {
      var filerdData = await getNearbyUsers(event.distance);
      print("filterduser${filerdData}");

      emit(DistanceFilterState(
          mydata: filerdData,
          gender: state.gender,
          index: state.index,
          age1: state.age1,
          age2: state.age2,
          distance: state.distance));
    } catch (e) {
      log("DistanceFilterState${e}");
    }
  }

// Distance Slider function
  FutureOr<void> distanceFilterSliderEvent(
      DistanceFilterSliderEvent event, Emitter<HomeblocState> emit) {
    print("distane tapped");
    emit(DistanceFilterSliderState(
        gender: state.gender,
        index: state.index,
        age1: state.age1,
        age2: state.age2,
        distance: event.distance));
  }

  FutureOr<void> ageFilterEvent(
      AgeFilterEvent event, Emitter<HomeblocState> emit) {
    emit(AgeFilterState(
        gender: state.gender,
        index: state.index,
        age1: event.age1,
        age2: event.age2,
        distance: state.distance));
  }

// Gender filter
  FutureOr<void> showmeEvent(ShowmeEvent event, Emitter<HomeblocState> emit) {
    emit(ShowmeState(
        gender: event.gender,
        index: event.index,
        age1: state.age1,
        age2: state.age2,
        distance: state.distance));
  }

// Discover data updating
  FutureOr<void> discoverySubmissionEvent(
      DiscoverySubmissionEvent event, Emitter<HomeblocState> emit) async {
    Discovery discovery = Discovery();
    // emit(DiscoveryInitState(
    //     gender: state.gender,
    //     index: state.index,
    //     age1: state.age1,
    //     age2: state.age2,
    //     distance: state.distance));
    String? maxDistance;
    String? showme;
    List<String> ageRange = [];
    if (state.gender != null) {
      showme = state.gender.toString();
    }
    if (state.distance != null) {
      maxDistance = state.distance!.round().toString();
    }
    if (state.age1 != null) {
      ageRange.add(state.age1!.round().toString());
    }
    // print("discovery back${state.age1}")
    if (state.age2 != null) {
      ageRange.add(state.age2!.round().toString());
    }
    print("discovery back${state.age1}");
    await discovery.discoveryUpload(ageRange, maxDistance ?? "", showme ?? "");
    emit(DiscoverySubmissionState(
        gender: state.gender,
        index: state.index,
        age1: state.age1,
        age2: state.age2,
        distance: state.distance));
    add(InitUserEvent());
  }

  FutureOr<void> navigateToDiacoveryEvent(
      NavigateToDiacoveryEvent event, Emitter<HomeblocState> emit) async {
    List<String> _agerange = [];
    final String showme;
    final String maxDistance;
    String currentUserId = FirebaseAuth.instance.currentUser!.uid;

// Get the user's document reference
    DocumentReference userRef =
        await FirebaseFirestore.instance.collection('users').doc(currentUserId);

// Fetch the user's data
    try {
      DocumentSnapshot snapshot = await userRef.get();
      if (snapshot.exists) {
        Map<String, dynamic>? mydata = snapshot.data() as Map<String, dynamic>?;
        if (mydata != null) {
          List<dynamic> agerange = mydata["ageRange"];
          final _agerange = agerange
              .map(
                (e) => e as String,
              )
              .toList();
          final showme = mydata["showme"].toString();
          final maxDistance = mydata["maxDistance"].toString();

          emit(NavigateToDiacoveryState(
              ageRange: _agerange,
              maxDistance: maxDistance,
              showme: showme,
              gender: state.gender,
              index: state.index,
              age1: state.age1,
              age2: state.age2,
              distance: state.distance));
          var filerdData = await getNearbyUsers(double.parse(maxDistance));
          print("filterduser${filerdData}");
          emit(DistanceFilterState(
              mydata: filerdData,
              gender: state.gender,
              index: state.index,
              age1: state.age1,
              age2: state.age2,
              distance: state.distance));
        }
      }
// ignore: body_might_complete_normally_catch_error
    } catch (e) {
      print("everything oki error${e}");
    }
  }

  FutureOr<void> currentUserLikeEvent(
      CurrentUserLikeEvent event, Emitter<HomeblocState> emit) async {
    try {
      FirebaseAuth _auth = FirebaseAuth.instance;
      DocumentReference documentReference = await FirebaseFirestore.instance
          .collection("users")
          .doc(_auth.currentUser!.uid);
      DocumentSnapshot snapshot = await documentReference.get();
      List<String> LikedUser = List<String>.from(snapshot.get('like'));
      log("home liked${LikedUser}");
      emit(CurrentUserLikeState(
          gender: state.gender,
          index: state.index,
          age1: state.age1,
          age2: state.age2,
          distance: state.distance,
          like: LikedUser));
    } catch (e) {
      log("home liked user finding error${e}");
    }
  }

  FutureOr<void> likeFromProfileEvent(
      LikeFromProfileEvent event, Emitter<HomeblocState> emit) async{
        try{
        FirebaseAuth _auth= FirebaseAuth.instance;
        DocumentReference documentReference=await FirebaseFirestore.instance.collection("users").doc(_auth.currentUser!.uid);
        DocumentSnapshot snapshot=await documentReference.get();
        int boostCount=int.parse(snapshot.get("boost"));
        if(boostCount>0){
        Boost boost=Boost();
       boost.boostReducing(1);
       liketoUser(event.like);
        }}catch(e){
          log("likefromprofile${e}");
        }
        
    add(ProfileViewInitEvent(uid: event.like));
    //add(CurrentUserLikeEvent());
    emit(LikeFromProfileState(
        gender: state.gender,
        index: state.index,
        age1: state.age1,
        age2: state.age2,
        distance: state.distance));
  }

  FutureOr<void> unfollowFromProfileEvent(
      UnfollowFromProfileEvent event, Emitter<HomeblocState> emit) {
    unLike(event.unlik);
    add(ProfileViewInitEvent(uid: event.unlik));
    // add(CurrentUserLikeEvent());
    emit(UnfollowFromProfileState(
        gender: state.gender,
        index: state.index,
        age1: state.age1,
        age2: state.age2,
        distance: state.distance));
  }

  FutureOr<void> filterationEvent(FilterationEvent event, Emitter<HomeblocState> emit) {
    FirebaseAuth _auth=FirebaseAuth.instance;
    HomeVaribale homeVaribale=HomeVaribale();
    String uid=_auth.currentUser!.uid;
                        var image;
                        var profile;
                        var dob = "";
                        var name;
                        Map user = {};
                        int numberOfUser = 0;
      
                        var mydata = event.dataList.firstWhere(
                          (element) => element["uid"] == uid,
                        );
                        List<dynamic> likeList = mydata['like'];
                        List<dynamic> ageRange = mydata['ageRange'];
                        final String showMe = mydata["showme"];
                        List<String> blockList =
                            List<String>.from(mydata['blockList']);
                        homeVaribale.boost = int.parse(mydata["boost"]);
                   
                     //   if (homeVaribale.uid != null) {
                          // removing Current user Account
                          event.dataList.removeWhere(
                            (user) => user['uid'] == homeVaribale.uid,
                          );
                       
                          // Removing blocked users
                           event.dataList.removeWhere(
                            (element) => blockList.contains(element['uid']),
                          );
                     
                        //  gender filter
                        List<Map<String, dynamic>> genderfilter = [];
                        if (showMe.contains('All')) {
                          genderfilter = [... event.dataList];
                        } else {
                          genderfilter =  event.dataList.where(
                            (element) {
                              return element['gender']
                                      .toString()
                                      .toLowerCase() ==
                                  showMe.toLowerCase();
                            },
                          ).toList();
                        }
                              
                        //distance filetr
                        List<Map<String, dynamic>> distanceFinfilter =
                            genderfilter
                                .where(
                                  (element) => event.distance
                                      .contains(element['uid']),
                                )
                                .toList();
                                 
                        //liked filter
                        List<Map<String, dynamic>> likedFilterd =
                            distanceFinfilter
                                .where(
                                  (element) =>
                                      !likeList.contains(element['uid']),
                                )
                                .toList();
                        //age filter
                        List<Map<String, dynamic>> filteredList =
                            likedFilterd.where(
                          (element) {
                            int age = homeVaribale.currentyear -
                                int.parse(element['dob'].split("/").last);
                            return age >= int.parse(ageRange[0]) &&
                                age <= int.parse(ageRange[1]);
                          },
                        ).toList();
                    
                        emit(FilterationState(  gender: state.gender,
                           index: state.index,
                             age1: state.age1,
                              age2: state.age2,
                             distance: state.distance,filteredList: filteredList,boost: int.parse( homeVaribale.boost.toString())));
  }
}
