  import 'package:bea_dating/core/domin/usecase/authentication.dart';
// import 'package:bea_dating/core/presentation/screen/profile_page/Profile/bloc/profile_bloc.dart';
import 'package:bea_dating/core/presentation/screen/profile_page/Profile/bloc/profile_bloc.dart';
import 'package:bea_dating/core/presentation/screen/welcome&rule/welcome_screen.dart';
import 'package:bea_dating/core/presentation/utilit/color.dart';
import 'package:bea_dating/core/presentation/utilit/fonts.dart';
import 'package:bea_dating/core/presentation/utilit/logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

AppBar viewprofileAppbar(BuildContext context,String username) {
  AppFonts appFonts=AppFonts();
    return AppBar(
       
      centerTitle: true,
      backgroundColor: whiteclr,
      leading: IconButton(
              onPressed: () {
                //  context.read<ProfileBloc>().add(NavigateBackToProfilEvent());
                //  print(aboutController.text);
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios)),
      title: Text(
        username,
        style: appFonts.flexhead(blackclr),
      ),
    
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