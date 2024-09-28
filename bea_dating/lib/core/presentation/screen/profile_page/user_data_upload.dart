import 'package:bea_dating/core/presentation/screen/bottom_navigation/bottom_navigator.dart.dart';
import 'package:bea_dating/core/presentation/screen/profile_page/bloc/profile_bloc.dart';
import 'package:bea_dating/core/presentation/screen/profile_page/profile_page.dart';
import 'package:bea_dating/core/presentation/utilit/color.dart';
import 'package:bea_dating/core/presentation/utilit/fonts.dart';
import 'package:bea_dating/core/presentation/utilit/mediaquery.dart';
import 'package:bea_dating/core/presentation/utilit/page_transcation/fade_transition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class UserdataUpload extends StatefulWidget {
  UserdataUpload({super.key});

  @override
  State<UserdataUpload> createState() => _UserdataUploadState();
}

class _UserdataUploadState extends State<UserdataUpload> {
  AppFonts appFonts = AppFonts();

  List<String> dropitem = ["Coffee Dating","Looking for Love","Hiking and Backpacking","Lets be Friends","Creative","Ride","Foodies","Sporty"];

  String dropdownValue = "Coffee Dating";

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileBloc, ProfileState>(
      listener: (context, state) {
        if(state is NavigateBacktoProfileState){
          Navigator.pop(context);
  // Navigator.pushReplacement(context, FadeTransitionPageRoute(child: ProfilePage()));
        }
        // TODO: implement listener
      },
      builder: (context, state) {
        return GestureDetector(onTap: () => FocusScope.of(context).unfocus(),
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
            body: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "About me",
                    style: appFonts.flextext(blackclr, size: 18, Fweight: 600),
                  ),
                  SizedBox(
                    height: mediaqueryHight(.01, context),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: useraboutContainer),
                    child: TextFormField(
                      maxLines: 3,
                      decoration: InputDecoration(
                          hintText: "about",
                          hintStyle: appFonts.flextext(blackshadow, size: 14),
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
                    style: appFonts.flextext(blackclr, size: 18, Fweight: 600),
                  ),
                  Container(
                    height: mediaqueryHight(.06, context),
                    width: mediaqueryWidth(100, context),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: useraboutContainer),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12, right: 23),
                      child: DropdownButton(
                        isExpanded: true, borderRadius: BorderRadius.circular(10),
          
                        // Initial Value
                        value: dropdownValue,
          
                        // Down Arrow Icon
                        icon: const Icon(Icons.keyboard_arrow_down),
          
                        // Array list of items
                        items: dropitem.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        // After selecting the desired option,it will
                        // change button value to selected value
                        onChanged: (String? newValue) {
                              dropdownValue=newValue!;
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
