import 'package:animated_loading_border/animated_loading_border.dart';
import 'package:bea_dating/core/domin/usecase/authentication.dart';
import 'package:bea_dating/core/presentation/screen/welcome&rule/welcome_screen.dart';
import 'package:bea_dating/core/presentation/utilit/color.dart';
import 'package:bea_dating/core/presentation/utilit/fonts.dart';
import 'package:bea_dating/core/presentation/utilit/logo.dart';
import 'package:bea_dating/core/presentation/utilit/mediaquery.dart';
import 'package:bea_dating/core/presentation/utilit/text_widget.dart';
import 'package:bea_dating/core/presentation/widgets/profile_widget/profile_widget.dart';
import 'package:bea_dating/core/presentation/widgets/profile_widget/user_core_cl_Widgets.dart';
import 'package:flutter/material.dart';
import 'package:zo_animated_border/zo_animated_border.dart';

// ignore: must_be_immutable
class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});
  Authentic authentic = Authentic();
  AppFonts appFonts = AppFonts();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: whiteclr,
        title: Text(
          "Bae",
          style: subLogoblack,
        ),
        actions: [
          IconButton(
              onPressed: () {
                authentic.signOutFromGoogle();

                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => WelcomeScreen(),
                ));
              },
              icon: Icon(
                Icons.edit_document,
                color: blackclr,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: whiteclr,
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      height: mediaqueryHight(.2, context),
                      width: mediaqueryWidth(.3, context),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: whiteclr,
                          image: DecorationImage(
                              image: AssetImage('assets/alone-boy.JPEG.jpg'),
                              fit: BoxFit.cover),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 2,
                              color: blackshadow,
                            )
                          ]),
                    ),
                    Column(
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 35,
                                top: 5.9,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () {},
                                    child: FollowWidget(
                                      appFonts: appFonts,
                                      headline: 'match',
                                      count: 10,
                                    ),
                                  ),
                                  SizedBox(
                                    width: mediaqueryWidth(.06, context),
                                  ),
                                  GestureDetector(
                                      onTap: () {},
                                      child: FollowWidget(
                                          appFonts: appFonts,
                                          count: 80,
                                          headline: "Like"))
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: mediaqueryHight(.02, context),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 32),
                          child: AnimatedLoadingBorder(borderColor: Color.fromARGB(255, 13, 208, 62),cornerRadius: 10,borderWidth: 6,duration: Duration(seconds: 3
                          ),
                            child: Container(
                              height: mediaqueryHight(.045, context),
                              width: mediaqueryHight(.13, context),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: blackclr,
                                boxShadow: [
                                  BoxShadow(
                                      color: blackshadow,
                                      blurRadius: 2,
                                      offset: Offset(2, 0),
                                      blurStyle: BlurStyle.normal)
                                ],
                              ),
                              child: Center(
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15, right: 10),
                                      child:Image.asset("assets/icons8-flash-48.png",scale: 3,)
                                    ),
                                    Text(
                                      "Boost",
                                      style: appFonts.flextext(whiteclr,size: 15),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: mediaqueryHight(.02, context),
                ),
                UserBasicdata(appFonts: appFonts),
                Container(
                  width: mediaqueryWidth(100, context),
                  height: mediaqueryHight(.29, context),
                  decoration: BoxDecoration(
                      color: Color.fromARGB(78, 136, 156, 155),
                      borderRadius: BorderRadius.circular(10)),
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3),
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(5),
                        child: Container(
                          height: 5,
                          width: 5,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [BoxShadow(blurRadius: 1)],
                            color: whiteclr,
                          ),
                          child: Center(
                            child: Icon(
                              Icons.add,
                              size: 30,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: mediaqueryHight(.01, context),
                ),
                Container(
                  width: mediaqueryWidth(100, context),
                  height: mediaqueryHight(.33, context),
                  decoration: BoxDecoration(
                    color: useraboutContainer,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CommonTextWidget(
                          text: "Lifestyle habit",
                          textfont: appFonts.flexhead(blackclr, size: 20),
                        ),
                        SizedBox(
                          height: mediaqueryHight(.02, context),
                        ),
                        UserCoreCollection(
                          headline: "How often do you drink?",
                          userOut: "Socially on  weekends",
                        ),
                        SizedBox(
                          height: mediaqueryHight(.01, context),
                        ),
                        UserCoreCollection(
                          headline: "How often do you smoke?",
                          userOut: "No-smoker",
                        ),
                        SizedBox(
                          height: mediaqueryHight(.01, context),
                        ),
                        UserCoreCollection(
                          headline: "Do you workout?",
                          userOut: "Everyday",
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: mediaqueryHight(.01, context),
                ),
                Container(
                  width: mediaqueryWidth(100, context),
                  height: mediaqueryHight(.28, context),
                  decoration: BoxDecoration(
                      color: useraboutContainer,
                      borderRadius: BorderRadius.circular(5)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // CommonTextWidget(
                        //   text: "Lifestyle habit",
                        //   textfont: appFonts.flexhead(whiteclr, size: 20),
                        // ),
                        // SizedBox(
                        //   height: mediaqueryHight(.02, context),
                        // ),
                        UserCoreCollection(
                          headline: "About",
                          userOut: "Adventurous, tech-savvy",
                        ),
                        SizedBox(
                          height: mediaqueryHight(.01, context),
                        ),
                        UserCoreCollection(
                          headline: "Expectation ?",
                          userOut: "Casual dating",
                        ),
                        SizedBox(
                          height: mediaqueryHight(.01, context),
                        ),
                        UserCoreCollection(
                          headline: "interest?",
                          userOut: " tech innovation",
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
