import 'package:bea_dating/core/presentation/utilit/color.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageViewPage extends StatelessWidget {
  const ImageViewPage({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: blackclr,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios,color: whiteclr,)),
      ),
      body: Container(color: blackclr,
        child: CachedNetworkImage(
          imageUrl: image,
          fit: BoxFit.contain,
          width: double.infinity,
          height: double.infinity,
          placeholder: (context, url) => Center(
            child: CircularProgressIndicator(
              color: clrGreen,
            ),
          ),
        ),
      ),
    );
  }
}
