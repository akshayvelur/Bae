import 'package:bea_dating/core/presentation/utilit/mediaquery.dart';
import 'package:flutter/material.dart';

class Backbuttons extends StatelessWidget {
  const Backbuttons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: mediaqueryHight(.075, context),
        width: mediaqueryWidth(.11, context),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          color: Colors.white,
        ),child:Icon(Icons.arrow_back_ios_new) ,);
  }
}
