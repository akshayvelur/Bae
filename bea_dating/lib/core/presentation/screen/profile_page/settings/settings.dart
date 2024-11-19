import 'package:bea_dating/core/data/service/account_deleting_service.dart';
import 'package:bea_dating/core/domin/usecase/authentication.dart';
import 'package:bea_dating/core/presentation/screen/profile_page/settings/blockedlist.dart';
import 'package:bea_dating/core/presentation/screen/profile_page/settings/mydata_page.dart';
import 'package:bea_dating/core/presentation/screen/welcome&rule/welcome_screen.dart';
import 'package:bea_dating/core/presentation/utilit/color.dart';
import 'package:bea_dating/core/presentation/utilit/fonts.dart';
import 'package:bea_dating/core/presentation/utilit/mediaquery.dart';
import 'package:bea_dating/core/presentation/utilit/page_transcation/fade_transition.dart';
import 'package:bea_dating/core/presentation/widgets/profile_widget/privacy_policy.dart';
import 'package:bea_dating/core/presentation/widgets/profile_widget/terms_and_condition.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  AppFonts appFonts = AppFonts();
   Authentic authentic = Authentic();
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: whiteclr,
      appBar: AppBar(backgroundColor: whiteclr,
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios)),
        title: Text("Settings", style: appFonts.appBarfont),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              height: mediaqueryHight(.2, context),
              width: mediaqueryWidth(100, context),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15), color: offWhiteshadow),
           child: Padding(
             padding: const EdgeInsets.all(15),
             child: Column(crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Text("Legal",style: appFonts.flextext(blackclr,size: 18,Fweight: 500),),
                 SizedBox(height: mediaqueryHight(.01, context),),
                 TextButton(onPressed: (){
                  Navigator.of(context).push(FadeTransitionPageRoute(child: TermsAndCondtionPage()));
                 }, child: Text("Terms and conditions of user",style: appFonts.flextext(blackclr,size: 15,Fweight: 400),))
                  ,TextButton(onPressed: (){
                    Navigator.of(context).push(FadeTransitionPageRoute(child: PrivacyPolicyPage()));
                  }, child: Text("Privacy policy",style: appFonts.flextext(blackclr,size: 15,Fweight: 400),))
               ],
             ),
           ), ),SizedBox(height: mediaqueryHight(.01, context),)
             ,Container(
              height: mediaqueryHight(.309, context),
              width: mediaqueryWidth(100, context),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15), color: offWhiteshadow),
           child: Padding(
             padding: const EdgeInsets.all(15),
             child: Column(crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Text("Personal data",style: appFonts.flextext(blackclr,size: 18,Fweight: 500),),
                 SizedBox(height: mediaqueryHight(.01, context),),
                 TextButton(onPressed: (){Navigator.of(context).push(FadeTransitionPageRoute(child: MydataPage()));}, child: Text("My data",style: appFonts.flextext(blackclr,size: 15,Fweight: 400),))
                  ,TextButton(onPressed: (){
                    DeleteAlertDialog(context, authentic);
                  }, child: Text("Delete my account",style: appFonts.flextext(blackclr,size: 15,Fweight: 400),)),
                  TextButton(onPressed: (){Navigator.of(context).push(FadeTransitionPageRoute(child: BlockedListPage()));}, child: Text("Blocked",style: appFonts.flextext(blackclr,size: 15,Fweight: 400),))
               ,TextButton(onPressed: (){
                showAlertDialog(context, authentic);
               }, child: Text("Logo Out",style: appFonts.flextext(blackclr,size: 15,Fweight: 400),))
               ],
             ),
           ), )
          ],
        ),
      ),
    );
  }
}
 showAlertDialog(BuildContext context,Authentic authentic){
 showDialog(context: context, builder: (context) {
  AppFonts appFonts =AppFonts();
   return AlertDialog(title: Text("Are you sure you want to log out?",style: appFonts.flextext(blackclr,Fweight: 400,size: 14),),actions: [
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
  DeleteAlertDialog(BuildContext context,Authentic authentic){
    showDialog(context: context, builder: (context) {
        AppFonts appFonts =AppFonts();
      return AlertDialog(title:  Text("Are you sure you want to delete your account? This action cannot be undone. ⚠️",style: appFonts.flextext(blackclr,Fweight: 400,size: 15),),actions: [
    TextButton(onPressed: (){
Navigator.of(context).pop();
    }, child: Text("cancel")),TextButton(onPressed: () {
         accountDeleting();
       //  authentic.signOutFromGoogle();
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => WelcomeScreen(),
                ));
   }, child: Text("delete",style: TextStyle(color: clrRed),))]);
      
    },);
  }