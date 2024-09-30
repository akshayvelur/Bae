import 'package:bea_dating/core/data/model/usermodel.dart';

import 'package:bea_dating/core/domin/usecase/authentication.dart';
import 'package:bea_dating/core/presentation/screen/profile_page/bloc/profile_bloc.dart';
import 'package:bea_dating/core/presentation/screen/profile_page/user_data/user_data_upload.dart';
import 'package:bea_dating/core/presentation/utilit/color.dart';
import 'package:bea_dating/core/presentation/utilit/fonts.dart';
import 'package:bea_dating/core/presentation/utilit/mediaquery.dart';
import 'package:bea_dating/core/presentation/utilit/page_transcation/fade_transition.dart';
import 'package:bea_dating/core/presentation/widgets/profile_widget/match_and_follow.dart';
import 'package:bea_dating/core/presentation/widgets/profile_widget/profile_app_bar_widget.dart';
import 'package:bea_dating/core/presentation/widgets/profile_widget/profile_boost_widget.dart';
import 'package:bea_dating/core/presentation/widgets/profile_widget/profile_grid_photo.dart';
import 'package:bea_dating/core/presentation/widgets/profile_widget/profile_lifestyle_widget.dart';
import 'package:bea_dating/core/presentation/widgets/profile_widget/profile_photo_widget.dart';
import 'package:bea_dating/core/presentation/widgets/profile_widget/profile_widget.dart';
import 'package:bea_dating/core/presentation/widgets/profile_widget/user_core_cl_Widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

// ignore: must_be_immutable
class ProfilePage extends StatefulWidget {
  ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Authentic authentic = Authentic();

  AppFonts appFonts = AppFonts();
  UserModel? myuser;
  bool isLoading = false;

  @override
  void initState() {
    context.read<ProfileBloc>().add(InitStateEvent());
    //datafetch();
    print("hii");

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileBloc, ProfileState>(
        buildWhen: (previous, current) => current is ProfileActionState,
        listener: (context, state) {
          if (state is NavigateToUserDataState) {
            Navigator.of(context)
                .push(FadeTransitionPageRoute(child: UserdataUpload()));
          }
          // if (state is LoadingState) {
          //   // showDialog(context: context, builder:(context) => Center(child: Container(height: 130,width: 130, child: LottieBuilder.asset("assets/Animation - 1727367862351.json"))));
          //   //return Scaffold( body:  Center(child: CircularProgressIndicator(),));
          // }
          if (state is LoadingSuccessState) {
            //  Navigator.pop(context);
          }
        },
        builder: (context, state) {
          if (state is LoadingState) {}
          if (state is IninitState) {
            myuser = state.user;
            //   if(myuser==null){
            //     context.read<ProfileBloc>().add(InitStateEvent());
            //  }
          } else if (state is LoadingSuccessState) {
    
            myuser = state.user;
            return Scaffold(
              backgroundColor: whiteclr,
              appBar: profileAppbar(context, authentic),
              body: SingleChildScrollView(
                child: Container(
                  color: whiteclr,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, top: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            if (myuser != null)
                              ProfilePhoto(
                                user: myuser!,
                              ),
                            Column(
                              children: [
                                MatchAndFollowWidget(appFonts: appFonts),
                                SizedBox(
                                  height: mediaqueryHight(.02, context),
                                ),
                                ProfileBoostWidget(appFonts: appFonts),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: mediaqueryHight(.02, context),
                        ),
                        if (myuser != null)
                          UserNameAgeBasic(
                            appFonts: appFonts,
                            user: myuser!,
                          ),
                        if (myuser != null)
                          GridPhotoWidget(
                            user: myuser!,
                          ),
                        SizedBox(
                          height: mediaqueryHight(.01, context),
                        ),
                        LifeStyleWidget(appFonts: appFonts),
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
          return Scaffold(
            appBar: profileAppbar(context, authentic),
            backgroundColor: whiteclr,
            body: Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      ShimmingContainer(
                        height: mediaqueryHight(.2, context),
                        width: mediaqueryWidth(.28, context),
                      ),
                      Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 65),
                                child: ShimmingContainer(
                                  height: mediaqueryHight(.07, context),
                                  width: mediaqueryWidth(.12, context),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 50),
                                child: ShimmingContainer(
                                  height: mediaqueryHight(.07, context),
                                  width: mediaqueryWidth(.12, context),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 65, top: 20),
                            child: ShimmingContainer(
                                width: mediaqueryWidth(.3, context),
                                height: mediaqueryHight(.045, context)),
                          )
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 27),
                    child: ShimmingContainer(
                        width: mediaqueryWidth(.38, context),
                        height: mediaqueryHight(.03, context)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 18),
                    child: ShimmingContainer(
                        width: mediaqueryWidth(.58, context),
                        height: mediaqueryHight(.02, context)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 38),
                    child: ShimmingContainer(
                        width: mediaqueryWidth(100, context),
                        height: mediaqueryHight(.14, context)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: ShimmingContainer(
                        width: mediaqueryWidth(100, context),
                        height: mediaqueryHight(.27, context)),
                  )
                ],
              ),
            ),
          );
        });
  }
}

class ShimmingContainer extends StatelessWidget {
  ShimmingContainer({super.key, required this.width, required this.height});
  var height;
  var width;
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey[100]!,
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
              color: blackclr, borderRadius: BorderRadius.circular(10)),
        ));
  }
}
