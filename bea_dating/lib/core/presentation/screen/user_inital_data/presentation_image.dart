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
import 'package:lottie/lottie.dart';

// ignore: must_be_immutable
class PresentaionImagePage extends StatefulWidget {
  PresentaionImagePage({super.key});

  @override
  State<PresentaionImagePage> createState() => _PresentaionImagePageState();
}

class _PresentaionImagePageState extends State<PresentaionImagePage> {
  AppFonts appFonts = AppFonts();
  List<XFile> image = [];
 

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();                                                   
      },
      child: BlocConsumer<UserDetailsBloc, UserDetailsState>(
        listener: (context, state) {
          // TODO: implement listener
               if (state is NavigateToHomeScreenState) {
            Navigator.of(context)
                .pushReplacement(FadeTransitionPageRoute(child: BottomNavigationScreen()));
          }
             if(state is PresentationPageLoading){
         showDialog(context: context, barrierDismissible: false,builder:(context) => Center(child: Container(height: 130,width: 130, child: LottieBuilder.asset("assets/Animation - 1727367862351.json"))));
          }
        },
        builder: (context, state) {
          if(state is ImageSelectedSatate){
            image=state.image;
          }else if( state is ImageDeletedSatate){
            image=state.image;
          }
       
          return Scaffold(
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
                            height: mediaqueryHight(.38, context),
                            width: mediaqueryWidth(.82, context),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              // color: const Color.fromARGB(236, 214, 210, 210)
                            ),
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
                                return InkWell(
                                  onTap: () {
                                    context.read<UserDetailsBloc>().add(ImageAddingEvent(image: image));
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
                                    child: image.length <= index
                                        ? Icon(
                                            Icons.add,
                                            size: 40,
                                          )
                                        : ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  boxShadow: [
                                                    BoxShadow(
                                                        blurRadius: 5,
                                                        color: blackclr)
                                                  ],
                                                  image: DecorationImage(
                                                      image: FileImage(File(
                                                          image[index].path)),
                                                      fit: BoxFit.cover)),
                                              child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 95, top: 95),
                                                  child: IconButton(
                                                      onPressed: () {
                                                       context.read<UserDetailsBloc>().add(ImageDeletionEvent(image: image, index: index));
                                                      },
                                                      icon: Icon(
                                                        Icons.cancel,
                                                        color: whiteclr,
                                                        shadows: [
                                                          Shadow(
                                                            blurRadius: 2,
                                                          )
                                                        ],
                                                      ))),
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
                            context
                                .read<UserDetailsBloc>()
                                .add(PresentationToHomeScreenEvent());
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
          );
        },
      ),
    );
  }



  
}
