import 'package:bea_dating/core/data/model/usermodel.dart';
import 'package:bea_dating/core/presentation/screen/chat_page/image_view.dart';
import 'package:bea_dating/core/presentation/utilit/color.dart';
import 'package:bea_dating/core/presentation/utilit/mediaquery.dart';
import 'package:bea_dating/core/presentation/utilit/page_transcation/fade_transition.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ViewGridPhotoWidget extends StatelessWidget {
  ViewGridPhotoWidget({super.key, required this.user});
  UserModel user;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: mediaqueryWidth(100, context),
      height: mediaqueryHight(.175, context),
      decoration: BoxDecoration(
          color: Color.fromARGB(78, 136, 156, 155),
          borderRadius: BorderRadius.circular(10)),
      child: GridView.builder(
        physics: BouncingScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 1,
            crossAxisSpacing: 8,
            mainAxisSpacing: 2,
            mainAxisExtent: 130,
            crossAxisCount: 3),
        padding: EdgeInsets.all(8),
        itemCount: user.image.length-1,
        itemBuilder: (context, index) {
          return InkWell(onTap: (){
            Navigator.of(context).push(FadeTransitionPageRoute(child: ImageViewPage(image: user.image[index + 1])));
          },
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [BoxShadow(blurRadius: 1)],
                  //image: DecorationImage( image: NetworkImage(index+2<=user.image.length?user.image[index+1]:"https://static.thenounproject.com/png/877484-200.png"),fit:BoxFit.cover),
                  color: whiteclr,
                ),
                child:ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: CachedNetworkImage(imageUrl: 
                   user.image[index + 1]
                        ,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                    placeholder: (context, url) =>
                        Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                )),
          );
        },
      ),
    );
  }
}



// Image.network(
                 
//                          user.image[index + 1],
                       
//                     fit: BoxFit.cover,
//                     loadingBuilder: (context, child, loadingProgress) {
//                       if (loadingProgress == null) {
//                         return child;
//                       } else {
//                         return Center(
//                             child: CircularProgressIndicator(
//                           value: loadingProgress.expectedTotalBytes != null
//                               ? loadingProgress.cumulativeBytesLoaded /
//                                   loadingProgress.expectedTotalBytes!
//                               : null,
//                         ));
//                       }
//                     },
//                   )