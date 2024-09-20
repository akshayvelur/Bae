import 'package:bea_dating/core/data/data_source/userdata.dart';
import 'package:bea_dating/core/data/model/usermodel.dart';

import 'package:bea_dating/core/domin/usecase/authentication.dart';
import 'package:bea_dating/core/presentation/screen/profile_page/bloc/profile_bloc.dart';
import 'package:bea_dating/core/presentation/screen/profile_page/user_data_upload.dart';
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

// ignore: must_be_immutable
class ProfilePage extends StatefulWidget {
  ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Authentic authentic = Authentic();

  AppFonts appFonts = AppFonts();
  UserModel ? myuser;
  

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
    return BlocConsumer<ProfileBloc, ProfileState>(listener: (context, state) {
      if (state is NavigateToUserDataState) {
        Navigator.of(context)
            .push(FadeTransitionPageRoute(child: UserdataUpload()));
      }
    }, builder: (context, state) {
      if(state is IninitState){
      
        myuser=state.user;
      }
      return Scaffold(
        appBar: profileAppbar(context, authentic),
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
                      ProfilePhoto(user: myuser!,),
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
                  UserNameAgeBasic(
                    appFonts: appFonts,user: myuser!,
                  ),
                  GridPhotoWidget(user: myuser!,),
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
    });
  }
}
