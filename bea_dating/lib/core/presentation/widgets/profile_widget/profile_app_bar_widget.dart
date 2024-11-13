  import 'package:bea_dating/core/domin/usecase/authentication.dart';
// import 'package:bea_dating/core/presentation/screen/profile_page/Profile/bloc/profile_bloc.dart';
import 'package:bea_dating/core/presentation/screen/profile_page/Profile/bloc/profile_bloc.dart';
import 'package:bea_dating/core/presentation/screen/welcome&rule/welcome_screen.dart';
import 'package:bea_dating/core/presentation/utilit/color.dart';
import 'package:bea_dating/core/presentation/utilit/logo.dart';
import 'package:bea_dating/core/presentation/utilit/page_transcation/fade_transition.dart';
import 'package:bea_dating/core/presentation/screen/profile_page/settings/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

AppBar profileAppbar(BuildContext context,Authentic authentic) {
    return AppBar(
       
      automaticallyImplyLeading: false,
      backgroundColor: whiteclr,
      title: Text(
        "Bae",
        style: subLogoblack,
      ),
      actions: [
        IconButton(
            onPressed: () {
              context.read<ProfileBloc>().add(NavigateToUserDataEvent());
       
            },
            icon: Icon(
              Icons.edit_document,
              color: blackclr,
            )),IconButton(onPressed: (){
              Navigator.of(context).push(FadeTransitionPageRoute(child: SettingsPage()));
                  //  showAlertDialog(context,authentic);
                  //    ZegoUIKitPrebuiltCallInvitationService().uninit();

            }, icon: Icon(Icons.settings))
      ],
    );
  }
  showAlertDialog(BuildContext context,Authentic authentic){
 showDialog(context: context, builder: (context) {
   return AlertDialog(title: Text("Logo Out"),actions: [
    TextButton(onPressed: (){
Navigator.of(context).pop();
    }, child: Text("cancel")),TextButton(onPressed: () {
         authentic.signOutFromGoogle();
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => WelcomeScreen(),
                ));
   }, child: Text("ok"))],);
 },);
  }