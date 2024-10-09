
import 'package:bea_dating/core/presentation/screen/profile_page/user_data/bloc/user_upload_bloc.dart';
import 'package:bea_dating/core/presentation/utilit/color.dart';
import 'package:bea_dating/core/presentation/utilit/fonts.dart';
import 'package:bea_dating/core/presentation/utilit/mediaquery.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

heightBottomsheet(context,String ?height) {
  AppFonts appfonts = AppFonts();
  TextEditingController textEditingController=TextEditingController();
  if(height!=null){textEditingController.text=height;}
  List<int> items = [];
  int limit = 200;
  int sum = 0;
  for (int i = 0; i < limit; i++) {
    sum = sum + 1;
    items.add(sum);
  }
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return BlocConsumer<UserUploadBloc, UserUploadState>(
        listener: (context, state) {
          // if (state is RelationshipSelectedState) {
          //   selected = state.reindex;
          // }
          // TODO: implement listener
        },
        builder: (context, state) {
          return Container(
            height: mediaqueryHight(.50, context),
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
                  padding: const EdgeInsets.only(top: 10, left: 10,right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.close)),
                        trailing: IconButton(onPressed: (){
                          context.read<UserUploadBloc>().add(HeightSelectingEvent(heights: textEditingController.text));
                          Navigator.pop(context);
                        }, icon: Icon(Icons.check)),
                      ),
                      Text(
                        "Height",
                        style:
                            appfonts.flextext(blackclr, size: 16, Fweight: 600),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 2, bottom: 20),
                        child: Text(
                          "Here's chance to add height to your profile.",
                          style: appfonts.flextext(blackclr,
                              size: 14, Fweight: 300),
                        ),
                      ),
                      Container(height: 58,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                          controller: textEditingController,
                            keyboardType:TextInputType.number,
                            decoration: InputDecoration(labelText: "Centimeteres",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10))),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: mediaqueryHight(.03, context),
                ),
               
              ],
            ),
          );
        },
      );
    },
  );
}
