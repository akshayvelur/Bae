  import 'package:bea_dating/core/domin/usecase/authentication.dart';
import 'package:bea_dating/core/presentation/screen/profile_page/bloc/profile_bloc.dart';
import 'package:bea_dating/core/presentation/screen/welcome&rule/welcome_screen.dart';
import 'package:bea_dating/core/presentation/utilit/color.dart';
import 'package:bea_dating/core/presentation/utilit/logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                   showAlertDialog(context,authentic);
            }, icon: Icon(Icons.logout))
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