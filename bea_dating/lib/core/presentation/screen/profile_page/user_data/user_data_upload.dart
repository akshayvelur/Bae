import 'package:bea_dating/core/presentation/screen/bottom_navigation/bottom_navigator.dart.dart';
import 'package:bea_dating/core/presentation/screen/profile_page/bloc/profile_bloc.dart';
import 'package:bea_dating/core/presentation/screen/profile_page/profile_page.dart';
import 'package:bea_dating/core/presentation/screen/profile_page/user_data/bloc/user_upload_bloc.dart';
import 'package:bea_dating/core/presentation/screen/profile_page/user_widget/drink_bottom_sheet.dart';
import 'package:bea_dating/core/presentation/screen/profile_page/user_widget/height_bottom_sheet.dart';
import 'package:bea_dating/core/presentation/screen/profile_page/user_widget/relation_botto_sheet.dart';
import 'package:bea_dating/core/presentation/utilit/color.dart';
import 'package:bea_dating/core/presentation/utilit/data/profile_adding.dart';
import 'package:bea_dating/core/presentation/utilit/fonts.dart';
import 'package:bea_dating/core/presentation/utilit/mediaquery.dart';
import 'package:bea_dating/core/presentation/utilit/page_transcation/fade_transition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class UserdataUpload extends StatefulWidget {
  UserdataUpload({super.key});

  @override
  State<UserdataUpload> createState() => _UserdataUploadState();
}

class _UserdataUploadState extends State<UserdataUpload> {
  AppFonts appFonts = AppFonts();
  BaseData baseData=BaseData();
  List<String> dropitem = [
    "Coffee Dating",
    "Looking for Love",
    "Hiking and Backpacking",
    "Lets be Friends",
    "Creative",
    "Ride",
    "Foodies",
    "Sporty"
  ];
  String dropdownValue = "Coffee Dating";
  String? about;
  String ?drink;

  TextEditingController aboutController = TextEditingController();
  String? relationship;
  String? heights;
  @override
  void initState() {
    context.read<UserUploadBloc>().add(UserLoadingEvent());
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                context.read<ProfileBloc>().add(NavigateBackToProfilEvent());
              },
              icon: Icon(Icons.arrow_back_ios)),
          title: Text(
            "Profile Details",
            style: appFonts.appBarfont,
          ),
        ),
        body: BlocListener<ProfileBloc, ProfileState>(
          listener: (context, state) {
            if (state is NavigateBacktoProfileState) {
              Navigator.pop(context);
            }
            // TODO: implement listener
          },
          child: BlocConsumer<UserUploadBloc, UserUploadState>(
            buildWhen: (previous, current) => current is UserUploadState,
            listener: (context, state) {
              switch (state.runtimeType) {
                case UserInterestSelectedState:
                  dropdownValue = state.interest!;
                case RelationshipSelectedState:
                  relationship = state.relationship;
                case HeightSelectedState:
                  heights = state.heights;
                  case DrinkSelectedState:
                  drink=state.drink;
              }
              // TODO: implement listener
            },
            builder: (context, state) {
              switch (state.runtimeType) {
                case UserLoadingSuccessState:
                  return Padding(
                    padding: const EdgeInsets.all(12),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "About me",
                            style: appFonts.flextext(blackclr,
                                size: 16, Fweight: 600),
                          ),
                          SizedBox(
                            height: mediaqueryHight(.01, context),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: useraboutContainer),
                            child: TextFormField(
                              controller: aboutController,
                              maxLines: 3,
                              decoration: InputDecoration(
                                  hintText: "about",
                                  hintStyle:
                                      appFonts.flextext(blackshadow, size: 14),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  counterText: ""),
                            ),
                          ),
                          SizedBox(
                            height: mediaqueryHight(.01, context),
                          ),
                          Text(
                            "Interest",
                            style: appFonts.flextext(blackclr,
                                size: 16, Fweight: 600),
                          ),
                          Container(
                            height: mediaqueryHight(.06, context),
                            width: mediaqueryWidth(100, context),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: useraboutContainer),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 12, right: 23),
                              child: DropdownButton(
                                isExpanded: true,
                                borderRadius: BorderRadius.circular(10),

                                // Initial Value
                                value: dropdownValue,

                                // Down Arrow Icon
                                icon: const Icon(Icons.keyboard_arrow_down),

                                // Array list of items
                                items: dropitem.map((String items) {
                                  return DropdownMenuItem(
                                    value: items,
                                    child: Text(
                                      items,
                                      style: appFonts.flextext(blackclr,
                                          size: 14, Fweight: 400),
                                    ),
                                  );
                                }).toList(),
                                //
                                onChanged: (String? newValue) {
                                  context.read<UserUploadBloc>().add(
                                      UserInterestAddingEvent(
                                          interest: newValue!));
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            height: mediaqueryHight(.01, context),
                          ),
                          Text(
                            "Relationship Goals",
                            style: appFonts.flextext(blackclr,
                                Fweight: 600, size: 16),
                          ),
                          SizedBox(
                            height: mediaqueryHight(.01, context),
                          ),
                          InkWell(
                            onTap: () {
                              relationBottomSheet(context);
                            },
                            child: Container(
                              height: mediaqueryHight(.06, context),
                              width: mediaqueryWidth(100, context),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: useraboutContainer),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: Icon(
                                          Icons.remove_red_eye,
                                          color: Colors.pinkAccent,
                                        ),
                                      ),
                                      SizedBox(
                                        width: mediaqueryHight(.01, context),
                                      ),
                                      Text(
                                        "Looking for",
                                        style: appFonts.flextext(blackclr,
                                            Fweight: 500, size: 14),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: mediaqueryHight(.12, context),
                                  ),
                                  Text(
                                    relationship == null
                                        ? ""
                                        : relationship.toString(),
                                    style: appFonts.flextext(blackclr,
                                        Fweight: 500, size: 14),
                                  ),
                                  SizedBox(
                                    width: mediaqueryWidth(.01, context),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: mediaqueryHight(.01, context),
                          ),
                          Text(
                            "Height",
                            style: appFonts.flextext(blackclr,
                                Fweight: 600, size: 15),
                          ),
                          SizedBox(
                            height: mediaqueryHight(.01, context),
                          ),
                          InkWell(
                            onTap: () {
                              heightBottomsheet(context);
                            },
                            child: Container(
                              height: mediaqueryHight(.06, context),
                              width: mediaqueryWidth(100, context),
                              decoration: BoxDecoration(
                                  color: useraboutContainer,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      "assets/scale.png",
                                      scale: 1,
                                      color: blackshadow,
                                    ),
                                    SizedBox(
                                      width: mediaqueryWidth(.01, context),
                                    ),
                                    Text(
                                      heights != null
                                          ? heights.toString()
                                          : "Add Height",
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: mediaqueryHight(.01, context),
                          ),
                          Text(
                            "Lifestyle habit",
                            style: appFonts.flextext(blackclr,
                                Fweight: 600, size: 15),
                          ),
                          SizedBox(
                            height: mediaqueryHight(.01, context),
                          ),
                          Container(
                            height: mediaqueryHight(.3, context),
                            width: mediaqueryWidth(100, context),
                            decoration: BoxDecoration(
                                color: useraboutContainer,
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              children: [
                                //drink list tile
                                Padding(
                                  padding: const EdgeInsets.only(left: 15,right: 25),
                                  child: InkWell(onTap: (){
                                DrinkBottomsheet(context, baseData.Drinks,"How often do you drink?");
                                  },
                                    child: ListTile(
                                      contentPadding: EdgeInsets.all(0),
                                      leading: Image.asset(
                                        "assets/icons8-wine-100.png",
                                        scale: 4,
                                      ),
                                      title: Text(
                                        "Drink",
                                        style: appFonts.flextext(blackclr,
                                            Fweight: 500, size: 14),
                                      ),
                                      trailing: Row(
                                        mainAxisSize: MainAxisSize
                                            .min, // To ensure the row takes minimal space
                                        children: [
                                          Text(drink!=null? drink.toString():"Empty",style: appFonts.flextext(blackclr,Fweight: 400,size: 14),),
                                          SizedBox(
                                              width:
                                                  8), // For spacing between icons
                                          Icon(Icons.keyboard_arrow_down, color: Colors.black),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                //GYM
                                  Padding(
                                  padding: const EdgeInsets.only(left: 15,right: 25),
                                  child: InkWell(onTap: (){
                                DrinkBottomsheet(context, baseData.Drinks,"How often do you drink?");
                                  },
                                    child: ListTile(
                                      contentPadding: EdgeInsets.all(0),
                                      leading: Image.asset(
                                        "assets/icons8-wine-100.png",
                                        scale: 4,
                                      ),
                                      title: Text(
                                        "Drink",
                                        style: appFonts.flextext(blackclr,
                                            Fweight: 500, size: 14),
                                      ),
                                      trailing: Row(
                                        mainAxisSize: MainAxisSize
                                            .min, // To ensure the row takes minimal space
                                        children: [
                                          Text(drink!=null? drink.toString():"Empty",style: appFonts.flextext(blackclr,Fweight: 400,size: 14),),
                                          SizedBox(
                                              width:
                                                  8), // For spacing between icons
                                          Icon(Icons.keyboard_arrow_down, color: Colors.black),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
              }
              return SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
