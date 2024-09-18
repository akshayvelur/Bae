
import 'package:bea_dating/core/presentation/utilit/color.dart';
import 'package:bea_dating/core/presentation/utilit/mediaquery.dart';
import 'package:flutter/material.dart';

class ProfilePhoto extends StatelessWidget {
  const ProfilePhoto({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: mediaqueryHight(.2, context),
      width: mediaqueryWidth(.3, context),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: whiteclr,
          image: DecorationImage(
              image: AssetImage('assets/alone-boy.JPEG.jpg'),
              fit: BoxFit.cover),
          boxShadow: [
            BoxShadow(
              blurRadius: 2,
              color: blackshadow,
            )
          ]),
    );
  }
}
