import 'package:bea_dating/core/domin/usecase/authentication.dart';
import 'package:bea_dating/core/presentation/utilit/color.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
            IconButton(onPressed: () {authentic.clearSharedpreference();}, icon: Icon(Icons.abc)),
            IconButton(onPressed: () {authentic.signOutFromGoogle();}, icon: Icon(Icons.cast_for_education))
          ],
        )),
      ),
    );
  }
}
