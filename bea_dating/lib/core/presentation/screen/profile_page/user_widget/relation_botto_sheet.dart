//import 'package:bea_dating/core/presentation/screen/profile_page/Profile/bloc/profile_bloc.dart';
import 'package:bea_dating/core/presentation/screen/profile_page/user_data/bloc/user_upload_bloc.dart';
import 'package:bea_dating/core/presentation/utilit/color.dart';
import 'package:bea_dating/core/presentation/utilit/fonts.dart';
import 'package:bea_dating/core/presentation/utilit/mediaquery.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

relationBottomSheet(context,String relationship ) {
  AppFonts appfonts = AppFonts();
  int? selected;
 List<String> items = [
    "Short-term",
    "Long-term",
    "Situationship",
    "Settle down"
  ];
    if(relationship.isNotEmpty){
    selected=items.indexOf(relationship);
  }
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return BlocConsumer<UserUploadBloc, UserUploadState>(
        listener: (context, state) {
          if (state is RelationshipSelectedState) {
            selected = state.reindex;
          }
          // TODO: implement listener
        },
        builder: (context, state) {
          return Container(
            height: mediaqueryHight(.38, context),
            width: mediaqueryWidth(100, context),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: mediaqueryHight(.02, context),
                ),
                Center(
                  child: Container(
                    height: mediaqueryHight(.004, context),
                    width: mediaqueryWidth(.13, context),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: blackclr),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40, left: 10),
                  child: Text(
                    "What are you looking for?",
                    style: appfonts.flextext(blackclr, size: 16, Fweight: 600),
                  ),
                ),
                SizedBox(
                  height: mediaqueryHight(.03, context),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: mediaqueryHight(.20, context),
                    width: mediaqueryWidth(100, context),
                    // color: blackclr,
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4, crossAxisSpacing: 4),
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            // print(items[index]);
                            context.read<UserUploadBloc>().add(
                                RelationshipSelectEvent(
                                    relationship: items[index], indext: index));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: index == selected ? Border.all() : null,
                                color: index == selected
                                    ? exbuttonGreen
                                    : useraboutContainer),
                            child: Center(
                              child: Text(
                                items[index],
                                style: appfonts.flextext(blackclr,
                                    Fweight: 600, size: 13),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
          );
        },
      );
    },
  );
}
//height Bottom Sheet

