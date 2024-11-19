import 'package:bea_dating/core/data/data_uploading/profile_image%20_uploading.dart';
import 'package:bea_dating/core/presentation/screen/bottom_navigation/bottom_navigator.dart.dart';
import 'package:bea_dating/core/presentation/screen/profile_page/Profile/bloc/profile_bloc.dart';
import 'package:bea_dating/core/presentation/utilit/color.dart';
import 'package:bea_dating/core/presentation/utilit/fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilrImageView extends StatelessWidget {
  ProfilrImageView({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blackclr,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: whiteclr,
            )),
        actions: [
          IconButton(
              onPressed: () {
               DeleteImageDialog(context, image);
              },
              icon: Icon(
                Icons.delete,
                color: whiteclr,size: 30,
              ))
        ],
      ),
      body: BlocConsumer<ProfileBloc, ProfileState>(
        listener: (context, state) {
          if(state is ProfilePhotoDetetingSate){
            Navigator.of(context).pop();
          }
          // TODO: implement listener
        },
        builder: (context, state) {
          return Container(
            color: blackclr,
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
          );
        },
      ),
    );
  }
}
  DeleteImageDialog(BuildContext context,String image){
    showDialog(context: context, builder: (context) {
        AppFonts appFonts =AppFonts();
      return AlertDialog(title:  Text("This photo will be deleted from the library. ",style: appFonts.flextext(blackshadow,Fweight: 400,size: 15),),actions: [
    TextButton(onPressed: (){
Navigator.of(context).pop();
    }, child: Text("cancel")),TextButton(onPressed: () {
         context
                    .read<ProfileBloc>()
                    .add(ProfilePhotoDetetingEvent(deleteId: image));
   Navigator.of(context).pop();
   }, child: Text("delete",style: TextStyle(color: clrRed),))]);
      
    },);
  }