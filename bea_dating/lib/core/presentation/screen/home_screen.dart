import 'package:bea_dating/core/domin/usecase/authentication.dart';
import 'package:bea_dating/core/presentation/screen/welcome_screen.dart';
import 'package:bea_dating/core/presentation/utilit/color.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HomeScreenPage extends StatelessWidget {
   HomeScreenPage({super.key});
Authentic authentic=Authentic();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Homescreen"),
      ),
      body: Container(
        color: whiteclr,
        child: Center(
            child: Row(
          children: [
            IconButton(onPressed: () {}, icon: Icon(Icons.abc)),
            IconButton(onPressed: () {authentic.signOutFromGoogle();
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => WelcomeScreen(),));}, icon: Icon(Icons.cast_for_education))
          ],
        )),
      ),
    );
  }
}
