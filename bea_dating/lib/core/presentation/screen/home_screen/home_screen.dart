import 'package:bea_dating/core/data/data_source/userdata.dart';
import 'package:bea_dating/core/presentation/screen/bottom_navigation/bottom_navigator.dart.dart';
import 'package:bea_dating/core/presentation/screen/home_screen/bloc/homebloc_bloc.dart';
import 'package:bea_dating/core/presentation/screen/home_screen/home_widget/Tab_controllers.dart';
import 'package:bea_dating/core/presentation/screen/home_screen/home_widget/card-data_widget.dart';
import 'package:bea_dating/core/presentation/screen/home_screen/home_widget/card_images.dart';
import 'package:bea_dating/core/presentation/screen/home_screen/home_widget/card_status.dart';
import 'package:bea_dating/core/presentation/screen/user_inital_data/block/user_details_bloc.dart';
import 'package:bea_dating/core/presentation/utilit/color.dart';
import 'package:bea_dating/core/presentation/utilit/fonts.dart';
import 'package:bea_dating/core/presentation/utilit/logo.dart';
import 'package:bea_dating/core/presentation/utilit/mediaquery.dart';
import 'package:bea_dating/core/presentation/widgets/container/container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

// ignore: must_be_immutable
class HomeScreenPage extends StatefulWidget {
  HomeScreenPage({super.key});

  @override
  State<HomeScreenPage> createState() => _HomeScreenPageState();
}

class _HomeScreenPageState extends State<HomeScreenPage> {
  final CardSwiperController controller = CardSwiperController();

  AppFonts appFonts = AppFonts();

  UserData userData = UserData();

  Map<String, Map<String, dynamic>> temp = {};

  int mainindex = 0;

  final cards = [
    'assets/Ride.MPEG.jpg',
    "assets/myBeach.MPEG - Copy.jpg",
    "assets/Drink.MPEG.jpg",
    "assets/Girl.MPEG.jpg"
  ];
  @override
  void initState() {
    mainindex = 0;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeblocBloc, HomeblocState>(
      listener: (context, state) {
        if (state is CountUpdatestate) {
          mainindex = state.count;
        }
        if (state is NumberOfUserSelectedState) {}
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text(
              "Bae",
              style: subLogoblack,
            ),
            backgroundColor: Colors.transparent,
          ),
          body: SafeArea(
            child: Column(
              children: [
                Flexible(
                  flex: 2,
                  child: FutureBuilder<List<Map<String, dynamic>>>(
                      future: userData.getData(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        }
                        if (snapshot.hasError) {
                          return Center(
                              child: Text('Error: ${snapshot.error}'));
                        }
                        if (!snapshot.hasData ||
                            snapshot.data!.isEmpty ||
                            snapshot.data!.isEmpty) {
                          return Center(child: Text('No data found'));
                        }

                        final List<Map<String, dynamic>> dataList =
                            snapshot.data!;
               
                        var user = dataList[mainindex];
                      
                        //print(numberofuser);
                        String name = user['name'];
                        var image = user['image'];
                        var profile = user["Profile"];
                        if(profile==null)
                        mainindex++;
                          int numberOfUser = dataList.length-1.abs();
                    //   print("gym null error check>>>>>>>>>>${profile['gym']}");

                        return profile!=null? CardSwiper(
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
                                TabControllers(image: image, name: name, profile: profile, mainindex: mainindex, numberOfUser: numberOfUser, controller: controller))
                                :
                       SizedBox();
                      }),
                ),
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