
import 'package:bea_dating/core/data/model/usermodel.dart';
import 'package:bea_dating/core/presentation/utilit/color.dart';
import 'package:bea_dating/core/presentation/utilit/mediaquery.dart';
import 'package:flutter/material.dart';

class GridPhotoWidget extends StatelessWidget {
 GridPhotoWidget({
    super.key,required this.user
  });
UserModel user;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: mediaqueryWidth(100, context),
      height: mediaqueryHight(.29, context),
      decoration: BoxDecoration(
          color: Color.fromARGB(78, 136, 156, 155),
          borderRadius: BorderRadius.circular(10)),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3),
        itemCount: 3,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(5),
            child: Container(
              height: 5,
              width: 5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: [BoxShadow(blurRadius: 1)],image: DecorationImage(image: NetworkImage(user.image[index+1])),
                color: whiteclr,
              ),
              // child: Center(
              //   child: Icon(
              //     Icons.add,
              //     size: 30,
              //   ),
              // ),
            ),
          );
        },
      ),
    );
  }
}
