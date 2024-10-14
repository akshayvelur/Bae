import 'package:bea_dating/core/data/model/usermodel.dart';
import 'package:bea_dating/core/presentation/utilit/color.dart';
import 'package:bea_dating/core/presentation/utilit/mediaquery.dart';
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
        child: Image.network(
          user.image.elementAt(0),
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) {
              return child;
            } else {
              return Center(
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes!
                      : null,
                ),
              );
            }
          },fit: BoxFit.cover,
        ),
      ),
    );
  }
}
