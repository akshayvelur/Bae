import 'package:bea_dating/core/data/data_source/userdata.dart';
import 'package:bea_dating/core/presentation/screen/bottom_navigation/bottom_navigator.dart.dart';
import 'package:bea_dating/core/presentation/screen/home_screen/bloc/homebloc_bloc.dart';
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
class HomeScreenPage extends StatelessWidget {
  HomeScreenPage({super.key});
  final CardSwiperController controller = CardSwiperController();
  AppFonts appFonts = AppFonts();
  UserData userData = UserData();
   Map<String, Map<String, dynamic>> temp = {};
   int mainindex=0;
   
  final cards = [
    'assets/Ride.MPEG.jpg',
    "assets/myBeach.MPEG - Copy.jpg",
    "assets/Drink.MPEG.jpg",
    "assets/Girl.MPEG.jpg"
  ];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeblocBloc, HomeblocState>(
      listener: (context, state) {
        if(state is CountUpdatestate){
          mainindex=state.count;
        }if(state is NumberOfUserSelectedState){
 
        }
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
                Flexible(flex: 2,
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
                        if (!snapshot.hasData || snapshot.data!.isEmpty||snapshot.data!.isEmpty) {
                          return Center(child: Text('No data found'));
                        }
                       
                        final List<Map<String, dynamic>> dataList =
                            snapshot.data!;
                            
                            
                            var user=dataList[mainindex];
                            int numberOfUser=dataList.length;
                            //print(numberofuser);
                            String name= user['name'];
                            var image =user['image'];
                            var profile=user['profile'];
                            print(profile);
                            
                        
                        return 
                              CardSwiper( 
                                controller: controller,
                                cardsCount: dataList.length,
                                onSwipe: _onSwipe,
                                onUndo: _onUndo,
                                numberOfCardsDisplayed: 1,
                                backCardOffset: const Offset(40, 40),
                                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                                cardBuilder: (
                                  context,
                                  index,
                                  horizontalThresholdPercentage,
                                  verticalThresholdPercentage,
                                ) =>DefaultTabController(length: 2,child:Scaffold(body: Column(
                                  children: [Container(child:TabBar(tabs:[Container(),Container()],),),
                                    Flexible(flex: 3,
                                      child: TabBarView(physics:PageScrollPhysics(),children: [
                                          Container(
                                        height: 606,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                 image[0]
                                                ),
                                                fit: BoxFit.cover)
                                                ),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.end,crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(10),
                                              child: Row(
                                                children: [
                                                  myContainer(),SizedBox(width: mediaqueryWidth(.06, context),),
                                                myContainer()],
                                              ),

                                            ), Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Row(
                                                  children: [
                                                    myContainer(),SizedBox(width: mediaqueryWidth(.06, context),),
                                                  myContainer()],
                                                ),
                                            ),
                                            SizedBox(height: mediaqueryHight(.01, context),),
                                            Padding(
                                              padding: const EdgeInsets.only(bottom: 20),
                                              child: Row(
                                                crossAxisAlignment: CrossAxisAlignment.end,
                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                children: [
                                                  FloatingActionButton(
                                                    backgroundColor: shadowclr,
                                                    onPressed: () {
                                                      if(mainindex<numberOfUser!){
                                                        print(numberOfUser);
                                                      context.read<HomeblocBloc>().add(CountEvent(count:mainindex+1));}
                                                        controller.swipe(CardSwiperDirection.left);
                                                   }, child: Image.asset(
                                                      'assets/icons8-cancel-100.png',
                                                      scale: 2.5,
                                                      fit: BoxFit.cover,
                                                    )
                                                  ),
                                                  FloatingActionButton(
                                                    backgroundColor: shadowclr,
                                                    onPressed: () {
                                                      
                                                        // controller.swipe(CardSwiperDirection.top);
                                                        },
                                                    child: Image.asset(
                                                      'assets/icons8-lightning-100.png',
                                                      scale: 2.5,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                  FloatingActionButton(
                                                    backgroundColor: shadowclr,
                                                    onPressed: () {
                                                      if(mainindex<numberOfUser!){
                                                      context.read<HomeblocBloc>().add(CountEvent(count:mainindex+1));}
                                                        controller.swipe(CardSwiperDirection.right);},
                                                    child: Image.asset('assets/icons8-love-96.png',
                                                        scale: 2.5, fit: BoxFit.cover),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        // add profile details using child
                                      ),
                                      // tab2
                                      Container(
                                        height: 606,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                 image[1]
                                                ),
                                                fit: BoxFit.cover)
                                                ),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.end,crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(10),
                                              child: Row(
                                                children: [
                                                  myContainer(),SizedBox(width: mediaqueryWidth(.06, context),),
                                                myContainer()],
                                              ),

                                            ), Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Row(
                                                  children: [
                                                    myContainer(),SizedBox(width: mediaqueryWidth(.06, context),),
                                                  myContainer()],
                                                ),
                                            ),
                                            SizedBox(height: mediaqueryHight(.01, context),),
                                            Padding(
                                              padding: const EdgeInsets.only(bottom: 20),
                                              child: Row(
                                                crossAxisAlignment: CrossAxisAlignment.end,
                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                children: [
                                                  FloatingActionButton(
                                                    backgroundColor: shadowclr,
                                                    onPressed: () {
                                                      if(mainindex<numberOfUser!){
                                                        print(numberOfUser);
                                                      context.read<HomeblocBloc>().add(CountEvent(count:mainindex+1));}
                                                        controller.swipe(CardSwiperDirection.left);
                                                   }, child: Image.asset(
                                                      'assets/icons8-cancel-100.png',
                                                      scale: 2.5,
                                                      fit: BoxFit.cover,
                                                    )
                                                  ),
                                                  FloatingActionButton(
                                                    backgroundColor: shadowclr,
                                                    onPressed: () {
                                                      
                                                        // controller.swipe(CardSwiperDirection.top);
                                                        },
                                                    child: Image.asset(
                                                      'assets/icons8-lightning-100.png',
                                                      scale: 2.5,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                  FloatingActionButton(
                                                    backgroundColor: shadowclr,
                                                    onPressed: () {
                                                      if(mainindex<numberOfUser!){
                                                      context.read<HomeblocBloc>().add(CountEvent(count:mainindex+1));}
                                                        controller.swipe(CardSwiperDirection.right);},
                                                    child: Image.asset('assets/icons8-love-96.png',
                                                        scale: 2.5, fit: BoxFit.cover),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        // add profile details using child
                                      ),
                                      ] ),
                                    ),
                                 SizedBox(height: 70,) ],
                                ),))

                              );
                            
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





// import 'package:bea_dating/core/data/data_source/userdata.dart';
// import 'package:bea_dating/core/presentation/screen/home_screen/bloc/homebloc_bloc.dart';
// import 'package:bea_dating/core/presentation/screen/profile_page/profile_page.dart';
// import 'package:bea_dating/core/presentation/utilit/color.dart';
// import 'package:bea_dating/core/presentation/utilit/fonts.dart';
// import 'package:bea_dating/core/presentation/utilit/logo.dart';
// import 'package:bea_dating/core/presentation/utilit/mediaquery.dart';
// import 'package:bea_dating/core/presentation/widgets/container/container.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_card_swiper/flutter_card_swiper.dart';

// // ignore: must_be_immutable
// class HomeScreenPage extends StatefulWidget {
//   HomeScreenPage({super.key});

//   @override
//   State<HomeScreenPage> createState() => _HomeScreenPageState();
// }

// class _HomeScreenPageState extends State<HomeScreenPage> {
//   final CardSwiperController controller = CardSwiperController();

//   AppFonts appFonts = AppFonts();

//   final cards = [
//     'assets/Ride.MPEG.jpg',
//     "assets/myBeach.MPEG - Copy.jpg",
//     "assets/Drink.MPEG.jpg",
//     "assets/Girl.MPEG.jpg"
//   ];
//  UserData userData=UserData();
// @override
//   void initState() {
//     context.read<HomeblocBloc>().add(Initevent());
//     // TODO: implement initState
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       extendBodyBehindAppBar: true,
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         title: Text(
//           "Bae",
//           style: subLogoblack,
//         ),
//         backgroundColor: Colors.transparent,
//       ),
//       body: SafeArea(
//         child: Column(
//           children: [
//             Flexible(
//               child: FutureBuilder<List<Map<String,dynamic>>>(future: userData.getData(), builder: (context, snapshot) {
//                    if (snapshot.connectionState == ConnectionState.waiting) {
//               return Center(child: CircularProgressIndicator());
//                         }
//                         if (snapshot.hasError) {
//               return Center(child: Text('Error: ${snapshot.error}'));
//                         }
//                         if (!snapshot.hasData || snapshot.data!.isEmpty) {
//               return Center(child: Text('No data found'));
//                         }
//               final List<Map<String, dynamic>> dataList = snapshot.data!;
              
//               print(dataList);
//                 return ListView.builder(semanticChildCount: 1,
//               itemCount: dataList.length,
//               itemBuilder: (context, index) {
//                 var user1 = dataList[index];
//               print(user1);

//                 return 
//                 CardSwiper(controller:  controller, cardsCount: user1.length,
//                  onSwipe: _onSwipe,
//                 onUndo: _onUndo,
//                 numberOfCardsDisplayed: 3,
//                 backCardOffset: const Offset(40, 40),
//                 padding: const EdgeInsets.all(24.0), cardBuilder: (
//                   context,
//                   index,
//                   horizontalThresholdPercentage,
//                   verticalThresholdPercentage,
//                 ) =>
//                     cards[index]))
//               },);
//               }),
//             )])));
//             }}
  