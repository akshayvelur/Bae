import 'package:bea_dating/core/domin/usecase/authentication.dart';
import 'package:bea_dating/core/presentation/screen/category/category_page.dart';
import 'package:bea_dating/core/presentation/screen/home_screen/bloc/homebloc_bloc.dart';
import 'package:bea_dating/core/presentation/screen/profile_page/Profile/profile_page.dart';
import 'package:bea_dating/core/presentation/screen/chat_page/chat_page.dart';
import 'package:bea_dating/core/presentation/screen/home_screen/home_screen.dart';
import 'package:bea_dating/core/presentation/screen/notification_page/notification_page.dart';
import 'package:bea_dating/core/presentation/utilit/fonts.dart';
import 'package:bea_dating/core/presentation/utilit/mediaquery.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavigationScreen extends StatefulWidget {
  BottomNavigationScreen({super.key});

  @override
  _BottomNavigationScreenState createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int _selectedIndex = 0;
  Authentic authentic = Authentic();
  AppFonts appFonts = AppFonts();

  List<Widget> _screens = [
    HomeScreenPage(),
    ChatPage(),
    CategoryPage(),
    NotificationPage(),
    ProfilePage(),
  ];
  
  List<String> bticons = [
    "assets/icons8-indoor-camera-60.png",
    "assets/icons8-message-bot-100.png",
    "assets/icons8-diversity-100.png",
    "assets/icons8-notification-128.png",
    "assets/icons8-account-96.png"
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeblocBloc, HomeblocState>(
      builder: (context, state) {
        if (state is BottomNavigatorEindexState) {
          _selectedIndex = state.Eindex;
        }
        return Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            children: [
              _screens[_selectedIndex], // The current screen
              Positioned(
                bottom: 10,
                left: 10,
                right: 10,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Container(
                    height: mediaqueryHight(.08, context),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(204, 38, 37, 37),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: List.generate(
                        5,
                        (index) =>Container(
                         decoration: BoxDecoration( borderRadius: BorderRadius.circular(10),),
                          child: Material(color: const Color.fromARGB(0, 0, 0, 0),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(10),
                              splashColor: Color.fromARGB(255, 248, 248, 248),
                              onTap: () {
                                context.read<HomeblocBloc>().add(BottoNavigatorEindexEvent(Eindex: index));
                              },
                              child: Ink(
                                decoration: BoxDecoration(
                                
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Image(
                                  height: mediaqueryHight(.038, context),
                                  width: mediaqueryWidth(.078, context),
                                  image: AssetImage(bticons[index]),
                                  fit: BoxFit.fill,
                               color:
                                 _selectedIndex == index ?  Color.fromARGB(196, 0, 0, 0):Color.fromARGB(255, 255, 255, 255), ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

