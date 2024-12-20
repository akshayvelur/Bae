import 'package:bea_dating/core/data/model/usermodel.dart';

import 'package:bea_dating/core/domin/usecase/authentication.dart';
import 'package:bea_dating/core/presentation/screen/profile_page/Profile/profile_wigdet/profile_place_holder.dart';
import 'package:bea_dating/core/presentation/screen/profile_page/Profile/profile_wigdet/shimmer_widget.dart';
import 'package:bea_dating/core/presentation/screen/profile_page/Profile/bloc/profile_bloc.dart';
import 'package:bea_dating/core/presentation/screen/profile_page/user_data/user_data_upload.dart';
import 'package:bea_dating/core/presentation/utilit/color.dart';
import 'package:bea_dating/core/presentation/utilit/fonts.dart';
import 'package:bea_dating/core/presentation/utilit/mediaquery.dart';
import 'package:bea_dating/core/presentation/utilit/page_transcation/fade_transition.dart';
import 'package:bea_dating/core/presentation/utilit/text_widget.dart';
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
            Navigator.of(context).push(FadeTransitionPageRoute(
                child: UserdataUpload(
              userModel: myuser!,
            )));
          }

          if (state is LoadingSuccessState) {
            //  Navigator.pop(context);
          }
        },
        builder: (context, state) {
          if (state is LoadingState) {
            myuser = state.user;
          }
          if (state is IninitState) {
            myuser = state.user;
          }
          if (state is LoadingSuccessState) {
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
                                if (myuser != null
                                    // ignore: unnecessary_null_comparison
                                    &&
                                    // ignore: unnecessary_null_comparison
                                    myuser!.like != null &&
                                    // ignore: unnecessary_null_comparison
                                    myuser!.match != null)
                                  MatchAndFollowWidget(
                                    appFonts: appFonts,
                                    user: myuser!,
                                  ),
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
                        if (myuser!.profile.isNotEmpty)
                          LifeStyleWidget(
                            appFonts: appFonts,
                            myuser: myuser!,
                          ),
                        SizedBox(
                          height: mediaqueryHight(.01, context),
                        ),
                        Container(
                          width: mediaqueryWidth(100, context),
                          //  height: mediaqueryHight(.34, context),
                          decoration: BoxDecoration(
                              color: useraboutContainer,
                              image: DecorationImage(
                                  image: AssetImage("assets/drows.jpeg"),
                                  fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(20)),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 8, top: 12, bottom: 17),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CommonTextWidget(
                                  text: "About User",
                                  textfont:
                                      appFonts.flexhead(Colors.amber, size: 20),
                                ),
                                SizedBox(
                                  height: mediaqueryHight(.02, context),
                                ),
                                // if(myuser!=null)UserCoreCollection(
                                //       headline: "Height",
                                //       userOut: myuser!.profile['height'].toString(),
                                //     ),
                                // ignore: unnecessary_null_comparison
                                if (myuser!.gender != null)
                                  UserCoreCollection(
                                    headline: "Gender?",
                                    userOut: myuser!.gender,
                                  ),
                                SizedBox(
                                  height: mediaqueryHight(.01, context),
                                ),
                                if (myuser!.profile.containsKey('height'))
                                  UserCoreCollection(
                                    headline: "Height?",
                                    userOut: myuser!.profile['height'],
                                  ),
                                SizedBox(
                                  height: mediaqueryHight(.01, context),
                                ),
                                // ignore: unnecessary_null_comparison
                                if (myuser!.expectation != null)
                                  UserCoreCollection(
                                    headline: "Expectation ?",
                                    userOut: myuser!.expectation,
                                  ),
                                SizedBox(
                                  height: mediaqueryHight(.01, context),
                                ),
                                // ignore: unnecessary_null_comparison
                                if (myuser!.interest != null)
                                  UserCoreCollection(
                                    headline: "Gender preference?",
                                    userOut: myuser!.interest,
                                  ),
                                SizedBox(
                                  height: mediaqueryHight(.01, context),
                                ),
                                if (myuser!.profile['interest type'] != null)
                                  UserCoreCollection(
                                    headline: "interest?",
                                    userOut: myuser!.profile['interest type']
                                        .toString(),
                                  ),
                                SizedBox(
                                  height: mediaqueryHight(.01, context),
                                ),
                                if (myuser!.profile.containsKey('relationship'))
                                  UserCoreCollection(
                                    headline: "Relationship?",
                                    userOut: myuser!.profile['relationship'],
                                  ),
                                SizedBox(
                                  height: mediaqueryHight(.01, context),
                                ),
                                if (myuser!.profile
                                    .containsKey('interest type'))
                                  UserCoreCollection(
                                    headline: "Interest type?",
                                    userOut: myuser!.profile['interest type'],
                                  ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: mediaqueryHight(.1, context),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
          return ProfilePlaceHolder(authentic: authentic);
        });
  }
}
