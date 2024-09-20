
import 'package:bea_dating/core/data/model/usermodel.dart';
import 'package:bea_dating/core/presentation/utilit/color.dart';
import 'package:bea_dating/core/presentation/utilit/mediaquery.dart';
import 'package:flutter/material.dart';

class ProfilePhoto extends StatelessWidget {
  ProfilePhoto({
    super.key,required this .user
  });
 UserModel user;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: mediaqueryHight(.2, context),
      width: mediaqueryWidth(.3, context),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: whiteclr,
          image: DecorationImage(
              image: NetworkImage(user.image.elementAt(0)),
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
