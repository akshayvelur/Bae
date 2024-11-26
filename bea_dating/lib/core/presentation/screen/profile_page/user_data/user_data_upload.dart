import 'package:bea_dating/core/data/data_source_getting/userdata.dart';
import 'package:bea_dating/core/data/model/usermodel.dart';
import 'package:bea_dating/core/presentation/screen/profile_page/Profile/bloc/profile_bloc.dart';
import 'package:bea_dating/core/presentation/screen/profile_page/Profile/profile_page.dart';
import 'package:bea_dating/core/presentation/screen/profile_page/user_data/bloc/user_upload_bloc.dart';
import 'package:bea_dating/core/presentation/screen/profile_page/user_data/widget/interest_dropdown.dart';
import 'package:bea_dating/core/presentation/screen/profile_page/user_widget/drink_bottom_sheet.dart';
import 'package:bea_dating/core/presentation/screen/profile_page/user_widget/gym_bottom_sheet.dart';
import 'package:bea_dating/core/presentation/screen/profile_page/user_widget/height_bottom_sheet.dart';
import 'package:bea_dating/core/presentation/screen/profile_page/user_widget/relation_botto_sheet.dart';
import 'package:bea_dating/core/presentation/screen/profile_page/user_widget/smoke_bottom_sheet.dart';
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
  UserdataUpload({super.key, required this.userModel});
  final UserModel userModel;
  @override
  State<UserdataUpload> createState() => _UserdataUploadState();
}

class _UserdataUploadState extends State<UserdataUpload> {
  AppFonts appFonts = AppFonts();
  BaseData baseData = BaseData();
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
  String? drink;
  String? gym;
  String? smoke;

  TextEditingController aboutController = TextEditingController();
  String? relationship;
  String? heights;
  @override
  void initState() {
    context.read<UserUploadBloc>().add(UserLoadingEvent());
    if (widget.userModel.profile['relationship'] != null) {
      relationship = widget.userModel.profile['relationship'];
    }
    if (widget.userModel.profile['height'] != null) {
      heights = widget.userModel.profile["height"];
    }
    if (widget.userModel.profile['drink'] != null) {
      drink = widget.userModel.profile['drink'];
    }
    if (widget.userModel.profile['gym'] != null) {
      gym = widget.userModel.profile['gym'];
    }
    if (widget.userModel.profile['smoke'] != null) {
      smoke = widget.userModel.profile['smoke'];
    }
    if (widget.userModel.profile['interest type'] != null) {
      dropdownValue = widget.userModel.profile['interest type'];
    }
    if (widget.userModel.profile['about'] != null) {
      about = widget.userModel.profile['about'];
      aboutController.text = about!;
    }

    print(about);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                //  print(aboutController.text);
                context
                    .read<UserUploadBloc>()
                    .add(UserBackDataUpload(about: aboutController.text));
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
              context.read<ProfileBloc>().add(InitStateEvent());
              Navigator.pop(context);
            }
            // TODO: implement listener
          },
          child: BlocConsumer<UserUploadBloc, UserUploadState>(
            // ignore: unnecessary_type_check
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
                  drink = state.drink;
                case GymSelectedState:
                  gym = state.gym;
                case SmokeSelectedState:
                  smoke = state.smoke;
                case UserBackDataSubmitted:
                  context.read<ProfileBloc>().add(NavigateBackToProfilEvent());
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
                          InterestWidget(
                              dropdownValue: dropdownValue,
                              dropitem: dropitem,
                              appFonts: appFonts),
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
                              relationBottomSheet(context,relationship!);
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
                              heightBottomsheet(context, heights);
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
                            height: mediaqueryHight(.23, context),
                            width: mediaqueryWidth(100, context),
                            decoration: BoxDecoration(
                                color: useraboutContainer,
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: mediaqueryHight(.01, context),
                                ),
                                //drink list tile
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15, right: 25),
                                  child: InkWell(
                                    onTap: () {
                                      DrinkBottomsheet(context, baseData.Drinks,drink!,
                                          "How often do you drink?");
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
                                          Text(
                                            drink != null
                                                ? drink.toString()
                                                : "Empty",
                                            style: appFonts.flextext(blackclr,
                                                Fweight: 400, size: 14),
                                          ),
                                          SizedBox(
                                              width:
                                                  8), // For spacing between icons
                                          Icon(Icons.keyboard_arrow_down,
                                              color: Colors.black),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                //GYM
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15, right: 25),
                                  child: InkWell(
                                    onTap: () {
                                      gymBottomsheet(context, baseData.gym,gym!,
                                          "Do you workout?");
                                    },
                                    child: ListTile(
                                      contentPadding: EdgeInsets.all(0),
                                      leading: Image.asset(
                                        "assets/icons8-gym-100.png",
                                        scale: 4,
                                      ),
                                      title: Text(
                                        "Gym",
                                        style: appFonts.flextext(blackclr,
                                            Fweight: 500, size: 14),
                                      ),
                                      trailing: Row(
                                        mainAxisSize: MainAxisSize
                                            .min, // To ensure the row takes minimal space
                                        children: [
                                          Text(
                                            gym != null
                                                ? gym.toString()
                                                : "Empty",
                                            style: appFonts.flextext(blackclr,
                                                Fweight: 400, size: 14),
                                          ),
                                          SizedBox(
                                              width:
                                                  8), // For spacing between icons
                                          Icon(Icons.keyboard_arrow_down,
                                              color: Colors.black),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                //smoke
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15, right: 25),
                                  child: InkWell(
                                    onTap: () {
                                      smokeBottomsheet(context, baseData.smoke,smoke!,
                                          "How often do you smoke?");
                                    },
                                    child: ListTile(
                                      contentPadding: EdgeInsets.all(0),
                                      leading: Image.asset(
                                        "assets/icons8-joint-100.png",
                                        scale: 4,
                                      ),
                                      title: Text(
                                        "Smoke",
                                        style: appFonts.flextext(blackclr,
                                            Fweight: 500, size: 14),
                                      ),
                                      trailing: Row(
                                        mainAxisSize: MainAxisSize
                                            .min, // To ensure the row takes minimal space
                                        children: [
                                          Text(
                                            smoke != null
                                                ? smoke.toString()
                                                : "Empty",
                                            style: appFonts.flextext(blackclr,
                                                Fweight: 400, size: 14),
                                          ),
                                          SizedBox(
                                              width:
                                                  8), // For spacing between icons
                                          Icon(Icons.keyboard_arrow_down,
                                              color: Colors.black),
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
