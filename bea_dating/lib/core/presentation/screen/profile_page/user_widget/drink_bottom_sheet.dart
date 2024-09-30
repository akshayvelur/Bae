import 'package:bea_dating/core/presentation/screen/profile_page/user_data/bloc/user_upload_bloc.dart';
import 'package:bea_dating/core/presentation/utilit/color.dart';
import 'package:bea_dating/core/presentation/utilit/fonts.dart';
import 'package:bea_dating/core/presentation/utilit/mediaquery.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

DrinkBottomsheet(context, List<String> items, String headline) {
  AppFonts appfonts = AppFonts();
  int? selected;
  
  



  showModalBottomSheet(
    context: context,
    builder: (context) {
      return BlocConsumer<UserUploadBloc, UserUploadState>(
        listener: (context, state) {
          if (state is DrinkSelectedState) {
            selected = state.index;
           // print();
          }
          // TODO: implement listener
        },
        builder: (context, state) {
          return Container(
            height: mediaqueryHight(.35, context),
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
                  padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  SizedBox(height: mediaqueryHight(.03, context),),
                      Text(
                        headline,
                        style:
                            appfonts.flextext(blackclr, size: 16, Fweight: 600),
                      ),
                      SizedBox(
                        height: mediaqueryHight(.03, context),
                      ),
                      Container(
                          height: 150,
                          // color: useraboutContainer,
                          child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 10,
                                    mainAxisExtent: 40,
                                    mainAxisSpacing: 10),
                            itemCount: items.length,
                            itemBuilder: (context, index) {
                              return InkWell(onTap: (){
                                context.read<UserUploadBloc>().add(DrinkSelectEvent(drink: items[index], indext: index));
                              },
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color:selected==index?exbuttonGreen: useraboutContainer,
                                      border:selected==index? Border.all():null),
                                  child: Center(child: Text(items[index])),
                                ),
                              );
                            },
                          ))
                    ],
                  ),
                ),
              
              ],
            ),
          );
        },
      );
    },
  );
}
