import 'dart:developer';

import 'package:bea_dating/core/data/data_source_getting/like_user.dart';
import 'package:bea_dating/core/data/model/usermodel.dart';
import 'package:bea_dating/core/presentation/screen/home_screen/bloc/homebloc_bloc.dart';
import 'package:bea_dating/core/presentation/screen/home_screen/view_account/view_account_widgets/view_pr_like_match_name.dart';
import 'package:bea_dating/core/presentation/screen/profile_page/Profile/bloc/profile_bloc.dart';
import 'package:bea_dating/core/presentation/screen/profile_page/like_match_view/match_view.dart';
import 'package:bea_dating/core/presentation/utilit/color.dart';
import 'package:bea_dating/core/presentation/utilit/fonts.dart';
import 'package:bea_dating/core/presentation/utilit/mediaquery.dart';
import 'package:bea_dating/core/presentation/utilit/page_transcation/fade_transition.dart';
import 'package:bea_dating/core/presentation/widgets/profile_widget/profile_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../profile_page/like_match_view/Like_view.dart';

class ViewMatchAndFollowWidget extends StatefulWidget {
  ViewMatchAndFollowWidget(
      {super.key, required this.appFonts, required this.user});

  final AppFonts appFonts;
  UserModel user;
 FirebaseAuth _auth=FirebaseAuth.instance;

  @override
  State<ViewMatchAndFollowWidget> createState() =>
      _ViewMatchAndFollowWidgetState();
}

class _ViewMatchAndFollowWidgetState extends State<ViewMatchAndFollowWidget> {
  @override
   List<String>LikedUsers=[];
  void initState() {
    context.read<HomeblocBloc>().add(CurrentUserLikeEvent());
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeblocBloc, HomeblocState>(
      listener: (context, state) {
        
        // TODO: implement listener
      },
      builder: (context, state) {
        if(state is CurrentUserLikeState){
            LikedUsers=state.like;
          
        }
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 35,
                top: 5.9,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(FadeTransitionPageRoute(
                          child: MatchListView(
                        user: widget.user,
                        headline: "match",
                      )));
                    },
                    child: ViewFollowWidget(
                      appFonts: widget.appFonts,
                      headline: 'match',
                      count: widget.user.match.length,
                    ),
                  ),
                  SizedBox(
                    width: mediaqueryWidth(.06, context),
                  ),
                  GestureDetector(
                      onTap: () {
                      
                        Navigator.of(context).push(FadeTransitionPageRoute(
                            child: LikeListView(
                          user: widget.user,
                          headline: "Like",
                        )));
                      },
                      child: ViewFollowWidget(
                          appFonts: widget.appFonts,
                          count: widget.user.like.length,
                          headline: "Like")),
                ],
              ),
            ),
            SizedBox(
              height: mediaqueryHight(.02, context),
            ),
           LikedUsers.contains(widget.user.uid)?
          //  unfollowing
            Padding(
              padding: const EdgeInsets.only(left: 35),
              child: InkWell(
                onTap: () {
                 
                   context.read<HomeblocBloc>().add(UnfollowFromProfileEvent(unlik: widget.user.uid));
                  
                },
                child: Container(
                    height: mediaqueryHight(.05, context),
                    width: mediaqueryWidth(.25, context),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: blackshadow),
                    child: Row(crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.heart_broken,
                          color: whiteclr,
                          size: 25,
                        ),SizedBox(width: mediaqueryHight(.01, context),)
                        ,Text("UnLike",style: widget.appFonts.flextext(whiteclr,Fweight:400,size: 14 ),)
                      ],
                    )),
              ),
            ):  
                // following
             Padding(
              padding: const EdgeInsets.only(left: 35),
              child: InkWell(
                onTap: () {
                   if(widget.user.uid!=widget._auth.currentUser!.uid){
                  context.read<HomeblocBloc>().add(LikeFromProfileEvent(like: widget.user.uid));
                   }
                    // liketoUser(widget.user.uid); 
                },
                child: Container(
                    height: mediaqueryHight(.05, context),
                    width: mediaqueryWidth(.25, context),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.blue),
                    child: Row(crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.favorite,
                          color: whiteclr,
                          size: 25,
                        ),SizedBox(width: mediaqueryHight(.01, context),)
                        ,Text("Like",style: widget.appFonts.flextext(whiteclr,Fweight:400,size: 14 ),)
                      ],
                    )),
              ),
            )
          ],
        );
      },
    );
  }
}
