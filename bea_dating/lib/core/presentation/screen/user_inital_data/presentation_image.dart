import 'dart:io';

import 'package:bea_dating/core/presentation/screen/bottom_navigation/bottom_navigator.dart.dart';
import 'package:bea_dating/core/presentation/screen/user_inital_data/block/user_details_bloc.dart';
import 'package:bea_dating/core/presentation/utilit/color.dart';
import 'package:bea_dating/core/presentation/utilit/fonts.dart';
import 'package:bea_dating/core/presentation/utilit/mediaquery.dart';
import 'package:bea_dating/core/presentation/utilit/page_transcation/fade_transition.dart';
import 'package:bea_dating/core/presentation/widgets/backbutton/back_button.dart';
import 'package:bea_dating/core/presentation/widgets/userintroduction/User_greenbutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

// ignore: must_be_immutable
class PresentaionImagePage extends StatefulWidget {
  PresentaionImagePage({super.key});

  @override
  State<PresentaionImagePage> createState() => _PresentaionImagePageState();
}

class _PresentaionImagePageState extends State<PresentaionImagePage> {
  AppFonts appFonts = AppFonts();
  final ImagePicker _picker = ImagePicker();
  List<XFile> image = [];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: BlocListener<UserDetailsBloc, UserDetailsState>(
        listener: (context, state) {
          if (state is NavigateToHomeScreenState) {
            Navigator.of(context)
                .push(FadeTransitionPageRoute(child: BottomNavigationScreen()));
          }
        },
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          body: SingleChildScrollView(
            child: Container(
              width: mediaqueryWidth(100, context),
              decoration: BoxDecoration(color: whiteclr),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: mediaqueryHight(.05, context),
                    ),
                    // Page back navigation
                    InkWell(
                        onTap: () async {
                          FocusScope.of(context).unfocus();
                          await Future.delayed(
                              const Duration(milliseconds: 250));
                          Navigator.pop(context);
                        },
                        child: const Backbuttons()),
                    SizedBox(
                      height: mediaqueryHight(.05, context),
                    ),
                    Text("it's all about presentation.",
                        style: appFonts.commonheadfont),
                    SizedBox(
                      height: mediaqueryHight(.09, context),
                    ),
                    Center(
                      child: Container(
                          //  color: Colors.amber,
                          height: mediaqueryHight(.36, context),
                          width: mediaqueryWidth(.82, context),
                          child: GridView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.all(28),
                            itemCount: 4,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 12,
                                    crossAxisSpacing: 12),
                            itemBuilder: (context, index) {
                              return InkWell(onLongPress: () {
                                imageDeletion(index);
                                print("long");
                              },onTap: (){
                                   pickImage();
                              },
                                child: Container(
                                  height: mediaqueryHight(.10, context),
                                  width: mediaqueryWidth(.28, context),
                                  decoration: BoxDecoration(
                                      color: whiteclr,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                            color: blackclr, blurRadius: 2)
                                      ]),
                                  child: image.length<=index
                                      ? Icon(
                                          Icons.add,
                                          size: 40,
                                        )
                                      : ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Image.file(
                                            File(image[index]!.path),
                                            fit: BoxFit.cover,
                                          )),
                                ),
                              );
                            },
                          )),
                    ),
                    SizedBox(
                      height: mediaqueryHight(.2, context),
                    ),
                    Center(
                      // Navigate to Next page
                      child: GestureDetector(
                        onTap: () {
                          // context
                          //     .read<UserDetailsBloc>()
                          //     .add(PresentationToHomeScreenEvent());
                        },
                        child: GreenNextbutton(
                          appFonts: appFonts,
                          content: "Next",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  pickImage() async {
    int maximageLimit=4;
    print("pick image");
    try {
      final List<XFile>? img = await ImagePicker().pickMultiImage();
      if (img!.isNotEmpty&&img.length+image.length<=maximageLimit) {
        image.addAll(img);
        print(image.length);
        setState(() {
          // image = File(img.)
          // print("image picked");
        });
      } else {}
    } catch (e) {}
  }
  imageDeletion(int index){

showDialog(context: context, builder:(context) {
  return 
},)
    
    image.removeAt(index);
    print(image.length);
  }
}

