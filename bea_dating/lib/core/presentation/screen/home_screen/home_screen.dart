// ignore_for_file: unnecessary_cast

import 'dart:developer';

import 'package:bea_dating/core/data/constant/call_info.dart';
import 'package:bea_dating/core/data/data_source_getting/userdata.dart';
import 'package:bea_dating/core/data/distance_finding/distance_finding.dart';
import 'package:bea_dating/core/data/service/day_timer.dart';
import 'package:bea_dating/core/domin/usecase/authentication.dart';
import 'package:bea_dating/core/presentation/screen/bottom_navigation/bottom_navigator.dart.dart';
import 'package:bea_dating/core/presentation/screen/home_screen/bloc/homebloc_bloc.dart';
import 'package:bea_dating/core/presentation/screen/home_screen/home_page_widget/home_page_appbar.dart';
import 'package:bea_dating/core/presentation/screen/home_screen/home_widget/Tab_controllers.dart';
import 'package:bea_dating/core/presentation/screen/home_screen/home_widget/card-data_widget.dart';
import 'package:bea_dating/core/presentation/screen/home_screen/home_widget/card_images.dart';
import 'package:bea_dating/core/presentation/screen/home_screen/home_widget/card_status.dart';
import 'package:bea_dating/core/presentation/screen/home_screen/filter_Page/discovery_settings.dart';
import 'package:bea_dating/core/presentation/screen/home_screen/view_account/view_account.dart';
import 'package:bea_dating/core/presentation/screen/user_inital_data/block/user_details_bloc.dart';
import 'package:bea_dating/core/presentation/utilit/color.dart';
import 'package:bea_dating/core/presentation/utilit/fonts.dart';
import 'package:bea_dating/core/presentation/utilit/logo.dart';
import 'package:bea_dating/core/presentation/utilit/mediaquery.dart';
import 'package:bea_dating/core/presentation/utilit/page_transcation/fade_transition.dart';
import 'package:bea_dating/core/presentation/widgets/container/container.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:lottie/lottie.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';

// ignore: must_be_immutable
class HomeScreenPage extends StatefulWidget {
  HomeScreenPage({super.key});

  @override
  State<HomeScreenPage> createState() => _HomeScreenPageState();
}

class _HomeScreenPageState extends State<HomeScreenPage>
    with WidgetsBindingObserver {
  final CardSwiperController controller = CardSwiperController();

  AppFonts appFonts = AppFonts();

  final FirebaseFirestore _firebaseStorage = FirebaseFirestore.instance;
  FirebaseAuth _auth = FirebaseAuth.instance;
  UserData userData = UserData();
  // ignore: unused_field
  Authentic _authentic = Authentic();
  Map<String, Map<String, dynamic>> temp = {};
  String? currentUsername;
  double radiusInKm = 20;
  int age = 0;
  int currentyear = DateTime.now().year;
  int mainindex = 0;
  String? uid;
  int ?boost;
  double? currentUserLatitude;
  double? currentUserLongitude;
  List<String> distancefilterd = [];
  Map<String, dynamic> currentUser = {};
  final cards = [
    'assets/Ride.MPEG.jpg',
    "assets/myBeach.MPEG - Copy.jpg",
    "assets/Drink.MPEG.jpg",
    "assets/Girl.MPEG.jpg"
  ];
  @override
  void initState() {
    mainindex = 0;
    scheduleDailyTask();
    context.read<HomeblocBloc>().add(InitUserEvent());
    //context.read<HomeblocBloc>().add(DistanceFilterEvent(distance: radiusInKm));
    WidgetsBinding.instance.addObserver(this);
    // TODO: implement initState
    super.initState();
    liveStatus("online");
    context.read<HomeblocBloc>().add(InitEvent());
  }

  void liveStatus(String status) async {
    await _firebaseStorage
        .collection("users")
        .doc(_auth.currentUser!.uid)
        .update({"status": status});
    if (status == "offline") {
      Timestamp timestamp = Timestamp.now();
      await _firebaseStorage
          .collection("users")
          .doc(_auth.currentUser!.uid)
          .update({"lastSeen": timestamp});
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      liveStatus("online");
    } else {
      liveStatus("offline");
      // if(_auth.currentUser !.ui) {
      //     liveStatus("offline");
      //   }
    }
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> usersStream =
      FirebaseFirestore.instance.collection('users').snapshots();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeblocBloc, HomeblocState>(
      buildWhen: (previous, current) =>
          previous is HomeActionState || current is HomeblocState,
      listener: (context, state) {
        if (state is DistanceFilterState) {
          distancefilterd = state.mydata;
          mainindex = 0;
        }
        if (state is InitState) {
          print(state.uid);
          uid = state.uid;
        }
        if (state is InitUserNameState) {
          currentUser = state.user;
        }

        if (state is CountUpdatestate) {
          mainindex = state.count;
        }
        // if (state is NumberOfUserSelectedState) {

        // }
        if (state is ViewAccountState) {
          Navigator.of(context).push(FadeTransitionPageRoute(
              child: ViewAccount(
            uid: state.uid,
          )));
        }
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: HomePageAppBar(context),
          body: SafeArea(
            child: Column(
              children: [
                Flexible(
                    flex: 2,
                    child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                      stream: usersStream,
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                              snapshot) {
                        if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        }

                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        }

                        List<Map<String, dynamic>> dataList = snapshot
                            .data!.docs
                            .map((doc) => doc.data() as Map<String, dynamic>)
                            .toList();
                        // log(dataList.toString());
                        //  finding the current user
                        var mydata = dataList.firstWhere(
                          (element) => element["uid"] == uid,
                        ) as Map<String, dynamic>;
                        List<dynamic> likeList = mydata['like'];
                        List<dynamic> ageRange = mydata['ageRange'];
                        final String showMe = mydata["showme"];
                             boost=int.parse(mydata["boost"]);
                        //  distance filter
                        dataList.removeWhere(
                          (users) => !distancefilterd.contains(users["uid"]),
                        );
                        //

                        if (uid != null) {
                          // removing Current user Account
                          dataList.removeWhere(
                            (user) => user['uid'] == uid,
                          );
                          if (likeList.isNotEmpty) {
                            dataList.removeWhere(
                              (user) => likeList.contains(user["uid"]),
                            );
                          }
                        }
                        // nearby us
                        //log("myUser${myUser["name"]}");
                        var image;
                        var profile;
                        var dob = "";
                        var name;
                        Map user = {};
                        int numberOfUser = 0;
                             //  gender filter
                            List<Map<String, dynamic>> genderfilter =[];
                           if(showMe.contains('All')){ 
                           genderfilter=[...dataList];
                           }else{
                           genderfilter= dataList.where((element) {
                            return element['gender'].toString().toLowerCase()==showMe.toLowerCase();},).toList();
                           }
                         //age filter
                           List<Map<String, dynamic>> filteredList =genderfilter.where((element) {
                            int age = currentyear -
                                int.parse(element['dob'].split("/").last);
                          return age>= int.parse(ageRange[0])&&age<=int.parse(ageRange[1]);   
                         },).toList();

                        if (filteredList.isNotEmpty) {
                          //if(dataList[mainindex])
                          user = filteredList[mainindex];

                          name = user['name'];
                          image = user['image'] ?? '';
                          profile = user["Profile"];
                          dob = user['dob'];
                      
                      print("boost${boost}");

                          print(dataList.length);
                       
                          if (profile == null &&
                              mainindex < filteredList.length - 1) 
                              mainindex++;
                          numberOfUser =(filteredList.length- 1.abs() > boost! )?boost!-1:filteredList.length- 1.abs();
                          //  filteredList.length - 1.abs();
                        }
                        print(
                            "User profile  Not Found>>>>>>>>>>${user['profile']}");
                        
                        // reported users
                        // dataList.removeWhere((element) => element["isReport"]=="false",);

                        return profile != null && filteredList.isNotEmpty
                            ? CardSwiper(
                                controller: controller,
                                cardsCount: filteredList.length,
                                onSwipe: _onSwipe,
                                onUndo: _onUndo,
                                numberOfCardsDisplayed: 1,
                                backCardOffset: const Offset(40, 40),
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10, bottom: 10),
                                cardBuilder: (
                                  context,
                                  index,
                                  horizontalThresholdPercentage,
                                  verticalThresholdPercentage,
                                ) =>
                                    InkWell(
                                        onTap: () {
                                          context.read<HomeblocBloc>().add(
                                              ViewAccountEvent(
                                                  uid: user['uid']));
                                        },
                                        child: TabControllers(
                                          image: image,
                                          name: name,
                                          profile: profile,
                                          mainindex: mainindex,
                                          numberOfUser: numberOfUser,
                                          controller: controller,
                                          dob: dob,
                                          currentuserUid: uid,
                                          user: user,
                                        )))
                            : Center(
                                child: LottieBuilder.asset(
                                    "assets/Animation - 1728468830285.json"));
                      },
                    )),
              ],
            ),
          ),
        );
      },
    );
  }

  bool _onSwipe(
    int previousIndex,
    int? currentIndex,
    CardSwiperDirection direction,

    
  ) {
    debugPrint(
      'The card $previousIndex was swiped to the ${direction.name}. Now the card $currentIndex is on top',
    );
    return true;
  }

  bool _onUndo(
    int? previousIndex,
    int currentIndex,
    CardSwiperDirection direction,
  ) {
    debugPrint(
      'The card $currentIndex was undod from the ${direction.name}',
    );
    return true;
  }
}
