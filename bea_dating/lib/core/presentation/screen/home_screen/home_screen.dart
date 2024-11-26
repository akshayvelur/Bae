import 'dart:developer';
import 'package:bea_dating/core/data/constant/call_info.dart';
import 'package:bea_dating/core/data/data_source_getting/userdata.dart';
import 'package:bea_dating/core/data/distance_finding/distance_finding.dart';
import 'package:bea_dating/core/data/service/day_timer.dart';
import 'package:bea_dating/core/data/service/online_service.dart';
import 'package:bea_dating/core/domin/usecase/authentication.dart';
import 'package:bea_dating/core/home_page_service.dart';
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
import 'package:bea_dating/core/presentation/utilit/home_varriables.dart';
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
  UserData userData = UserData();
  // ignore: unused_field
  Authentic _authentic = Authentic();
  FirebaseAuth _auth=FirebaseAuth.instance;
  HomeVaribale homeVaribale = HomeVaribale();
  List<Map<String, dynamic>> filteredList = [];
  @override
  void initState() {
    homeVaribale.mainindex = 0;
    scheduleDailyTask();
    context.read<HomeblocBloc>().add(InitUserEvent());
    WidgetsBinding.instance.addObserver(this);
    // TODO: implement initState
    super.initState();
    liveStatus("online");
    context.read<HomeblocBloc>().add(InitEvent());
  }

  @override

  void didChangeAppLifecycleState(AppLifecycleState state) {

    if (state == AppLifecycleState.inactive) {
      liveStatus("online");
    } else {
      liveStatus("offline");
    }
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeblocBloc, HomeblocState>(
      buildWhen: (previous, current) =>
          previous is HomeActionState || current is HomeblocState,
      listener: (context, state) {
        if (state is DistanceFilterState) {
          homeVaribale.distancefilterd = state.mydata;
          homeVaribale.mainindex = 0;
        }
        if (state is InitState) {
          print(state.uid);
          homeVaribale.uid = state.uid;
        }
        if (state is InitUserNameState) {
          homeVaribale.currentUser = state.user;
        }

        if (state is CountUpdatestate) {
          homeVaribale.mainindex = state.count;
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
        if (state is FilterationState) {
          print("fhdfffg${state.filteredList}");
          filteredList = state.filteredList;
          homeVaribale.boost = state.boost;
        }
        return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: HomePageAppBar(context, homeVaribale.boost??0,appFonts),
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
                        context.read<HomeblocBloc>().add(FilterationEvent(
                            dataList: dataList,
                            distance: homeVaribale.distancefilterd));

                        if (filteredList.isNotEmpty) {
                          homeVaribale.user =
                              filteredList[homeVaribale.mainindex];

                          homeVaribale.name = homeVaribale.user['name'];
                          homeVaribale.image = homeVaribale.user['image'] ?? '';
                          homeVaribale.profile = homeVaribale.user["Profile"];
                          homeVaribale.dob = homeVaribale.user['dob'];

                          if (homeVaribale.profile == null &&
                              homeVaribale.mainindex < filteredList.length - 1)
                            homeVaribale.mainindex++;
                          homeVaribale.numberOfUser =
                              (filteredList.length - 1.abs() >
                                      homeVaribale.boost!)
                                  ? homeVaribale.boost! - 1
                                  : filteredList.length - 1.abs();
                          //   //  filteredList.length - 1.abs();
                        }
                         
                        return homeVaribale.profile != null &&
                                filteredList.isNotEmpty
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
                                                  uid: homeVaribale
                                                      .user['uid']));
                                        },
                                        child: TabControllers(
                                          image: homeVaribale.image,
                                          name: homeVaribale.name,
                                          profile: homeVaribale.profile,
                                          mainindex: homeVaribale.mainindex,
                                          numberOfUser:
                                              homeVaribale.numberOfUser,
                                          controller: controller,
                                          dob: homeVaribale.dob,
                                          currentuserUid: homeVaribale.uid,
                                          user: homeVaribale.user,
                                          
                                        )))
                            : Center(
                                child: LottieBuilder.asset(
                                    "assets/Animation - 1732260189363.json"));
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
