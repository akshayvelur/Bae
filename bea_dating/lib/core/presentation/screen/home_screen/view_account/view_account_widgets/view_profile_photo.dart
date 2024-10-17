import 'package:bea_dating/core/data/model/usermodel.dart';
import 'package:bea_dating/core/presentation/utilit/color.dart';
import 'package:bea_dating/core/presentation/utilit/mediaquery.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ViewProfilePhoto extends StatelessWidget {
  ViewProfilePhoto({super.key, required this.user});
  UserModel user;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: mediaqueryHight(.2, context),
      width: mediaqueryWidth(.3, context),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: whiteclr,
          //  image: DecorationImage(
          //       image: NetworkImage(user.image.elementAt(0),),
          //       fit: BoxFit.cover),
          boxShadow: [
            BoxShadow(
              blurRadius: 2,
              color: blackshadow,
            )
          ]),
      child: ClipRRect(borderRadius: BorderRadius.circular(5),
        child: CachedNetworkImage(
        imageUrl:user.image.elementAt(0) ,fit:BoxFit.cover,width: double.infinity,height: double.infinity,
        placeholder: (context, url) => Center(child: CircularProgressIndicator()),
        errorWidget: (context, url, error) => Icon(Icons.error),
     ),
      ),
    );
  }
}
