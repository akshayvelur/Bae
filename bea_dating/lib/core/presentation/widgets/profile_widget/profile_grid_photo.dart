import 'package:bea_dating/core/data/model/usermodel.dart';
import 'package:bea_dating/core/presentation/screen/chat_page/image_view.dart';
import 'package:bea_dating/core/presentation/screen/profile_page/Profile/bloc/profile_bloc.dart';
import 'package:bea_dating/core/presentation/screen/profile_page/Profile/profile_wigdet/profile_image_viewing.dart';
import 'package:bea_dating/core/presentation/utilit/color.dart';
import 'package:bea_dating/core/presentation/utilit/mediaquery.dart';
import 'package:bea_dating/core/presentation/utilit/page_transcation/fade_transition.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class GridPhotoWidget extends StatelessWidget {
  GridPhotoWidget({super.key, required this.user});
  UserModel user;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileBloc, ProfileState>(
      listener: (context, state) {
        if(state is ProImageUploadingState){
          user=state.user!;
        }
        // TODO: implement listener
      },
      builder: (context, state) {
        return Container(
          width: mediaqueryWidth(100, context),
          height: mediaqueryHight(.340, context),
          decoration: BoxDecoration(
              color: blackclr, borderRadius: BorderRadius.circular(10)),
          child: GridView.builder(
            physics: BouncingScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 1,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                mainAxisExtent: 130,
                crossAxisCount: 3),
            padding: EdgeInsets.all(8),
            itemCount: user.image.length<=6?user.image.length:6,
            itemBuilder: (context, index) {
              print(index);
              return InkWell(
                onTap: () {
                  if (user.image.length - 1 > index) {
                    Navigator.of(context).push(FadeTransitionPageRoute(
                        child: ProfilrImageView(image: user.image[index + 1])));
                  }

                  if (index + 1 == user.image.length) {
                    context.read<ProfileBloc>().add(ProImageUploadingEvent());
                  }
                },
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [BoxShadow(blurRadius: 1)],
                      //image: DecorationImage( image: NetworkImage(index+2<=user.image.length?user.image[index+1]:"https://static.thenounproject.com/png/877484-200.png"),fit:BoxFit.cover),
                      color: blackshadow,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: CachedNetworkImage(
                        imageUrl: index + 2 <= user.image.length
                            ? user.image[index + 1]
                            : "https://static.thenounproject.com/png/877484-200.png",
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
      },
    );
  }
}
