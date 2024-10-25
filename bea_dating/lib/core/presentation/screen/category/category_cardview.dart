import 'dart:developer';

import 'package:bea_dating/core/data/data_source_getting/userdata.dart';
import 'package:bea_dating/core/domin/usecase/authentication.dart';
import 'package:bea_dating/core/presentation/screen/bottom_navigation/bottom_navigator.dart.dart';
import 'package:bea_dating/core/presentation/screen/category/cat_tabcontrollers.dart';
import 'package:bea_dating/core/presentation/screen/home_screen/bloc/homebloc_bloc.dart';
import 'package:bea_dating/core/presentation/screen/home_screen/home_widget/Tab_controllers.dart';
import 'package:bea_dating/core/presentation/screen/home_screen/home_widget/card-data_widget.dart';
import 'package:bea_dating/core/presentation/screen/home_screen/home_widget/card_images.dart';
import 'package:bea_dating/core/presentation/screen/home_screen/home_widget/card_status.dart';
import 'package:bea_dating/core/presentation/screen/home_screen/view_account/view_account.dart';
import 'package:bea_dating/core/presentation/screen/user_inital_data/block/user_details_bloc.dart';
import 'package:bea_dating/core/presentation/utilit/color.dart';
import 'package:bea_dating/core/presentation/utilit/fonts.dart';
import 'package:bea_dating/core/presentation/utilit/logo.dart';
import 'package:bea_dating/core/presentation/utilit/mediaquery.dart';
import 'package:bea_dating/core/presentation/utilit/page_transcation/fade_transition.dart';
import 'package:bea_dating/core/presentation/widgets/container/container.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:lottie/lottie.dart';

// ignore: must_be_immutable
class CategoryViewScreen extends StatefulWidget {
  CategoryViewScreen({super.key,required this.catId});
String catId;
  @override
  State<CategoryViewScreen> createState() => _CategoryViewScreenState();
}

class _CategoryViewScreenState extends State<CategoryViewScreen> {
  final CardSwiperController controller = CardSwiperController();

  AppFonts appFonts = AppFonts();

  UserData userData = UserData();
  Authentic _authentic = Authentic();
  Map<String, Map<String, dynamic>> temp = {};

  int mainindex = 0;
  String? uid;
  String ?filter;

  final cards = [
    'assets/Ride.MPEG.jpg',
    "assets/myBeach.MPEG - Copy.jpg",
    "assets/Drink.MPEG.jpg",
    "assets/Girl.MPEG.jpg"
  ];
  @override
  void initState() {
    filter=widget.catId;
    log(filter.toString());
    log("Looking for Love");
    mainindex = 0;
    context.read<HomeblocBloc>().add(InitEvent());
    // TODO: implement initState
    super.initState();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> usersStream =
      FirebaseFirestore.instance.collection('users').snapshots();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeblocBloc, HomeblocState>(
      listener: (context, state) {
        if (state is InitState) {
          print(state.uid);
          uid = state.uid;
        }
        if (state is CountUpdatestate) {
          mainindex = state.count;
        }
        // if (state is NumberOfUserSelectedState) {

        // }
         if (state is ViewAccountState) {
          Navigator.of(context).push(FadeTransitionPageRoute(child: ViewAccount(uid: state.uid,)));
        }
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
          
            actions:[ Text(
              "Bae",
              style: subLogoblack,
            ),SizedBox(width: mediaqueryWidth(.04, context),)],
            backgroundColor: Colors.transparent,
          ),
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
                          return CircularProgressIndicator();
                        }

                List<Map<String, dynamic>> dataList = snapshot.data!.docs
                     .map((doc) => doc.data() as Map<String, dynamic>)
                       .toList();
                     // log(dataList.toString());
                       if (uid != null) {
                             dataList.removeWhere((user) =>user['uid']==uid,);
                               }
                                var image ;
                                 var profile ;
                                  var dob="";
                                   var name;
                                   Map user={};
                             int numberOfUser =0;
                               List<Map<String, dynamic>> filterduser= dataList.where((user) => user['Profile']?['interest type']?.toString().trim().toUpperCase()==filter?.trim().toUpperCase(),).toList();
                                log(widget.catId.toString());

                               if(filterduser.isNotEmpty){
                               
                               
                         user=filterduser[mainindex];
                              // Debug log to check the list after removal
                      //  log("List after removal: ${dataList[mainindex]}");
                        //Data collecting area
                      //  log("datalist length${dataList.length}");
                         name = user['name'];
                        image = user['image'];
                        profile = user["Profile"];
                         dob=user['dob'];
                        if(profile==null&&mainindex < filterduser.length - 1)
                        mainindex++;
                          
                        
                       numberOfUser= filterduser.length-1.abs();
                        
                               }
                     print("gym null error check>>>>>>>>>>${user['profile']}");
                     log(filterduser.length.toString());
                   return profile!=null&&filterduser.isNotEmpty? 
                      CardSwiper(
                                controller: controller,
                                cardsCount: dataList.length,
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
                                     InkWell(onTap: () {
                                       context.read<HomeblocBloc>().add(ViewAccountEvent(uid: user['uid']));
                                     },child: CatTabControllers(image: image, name: name, profile: profile, mainindex: mainindex, numberOfUser: numberOfUser, controller: controller,dob: dob,currentuserUid: uid,user: user,))
                                    
                   ): Center(child: LottieBuilder.asset("assets/Animation - 1728468830285.json"));
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
