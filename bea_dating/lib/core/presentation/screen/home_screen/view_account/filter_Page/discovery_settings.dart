import 'package:bea_dating/core/presentation/screen/bottom_navigation/bottom_navigator.dart.dart';
import 'package:bea_dating/core/presentation/screen/home_screen/bloc/homebloc_bloc.dart';
import 'package:bea_dating/core/presentation/screen/home_screen/view_account/filter_Page/widget/age_widget.dart';
import 'package:bea_dating/core/presentation/screen/home_screen/view_account/filter_Page/widget/distance_widget.dart';
import 'package:bea_dating/core/presentation/utilit/color.dart';
import 'package:bea_dating/core/presentation/utilit/fonts.dart';
import 'package:bea_dating/core/presentation/utilit/mediaquery.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_multi_slider/flutter_multi_slider.dart';

class DiscoverySettings extends StatefulWidget {
  DiscoverySettings({super.key});

  @override
  State<DiscoverySettings> createState() => _DiscoverySettingsState();
}

class _DiscoverySettingsState extends State<DiscoverySettings> {
  @override
  void initState() {
    context.read<HomeblocBloc>().add(NavigateToDiacoveryEvent());
    // TODO: implement initState
    super.initState();
  }

  @override
  AppFonts appFonts = AppFonts();
  List<String> genderpre = ["Men", "Women", "Others", "All"];
  double _currentValue = 20;
  double _age1 = 18;
  double _age2 = 30;
  String? shomeGend;
  int? currentIndex;

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteclr,
      appBar: AppBar(
        backgroundColor: whiteclr,
        leading: IconButton(
            onPressed: () {
              context.read<HomeblocBloc>().add(DiscoverySubmissionEvent());
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios)),
        centerTitle: true,
        title: Text(
          "Dicovery settings",
          style: appFonts.appBarfont,
        ),
      ),
      body: BlocConsumer<HomeblocBloc, HomeblocState>(
        listener: (context, state) {
              if (state is DistanceFilterSliderState) {
          _currentValue = state.distance!;
          currentIndex=state.index;
        }
        if (state is AgeFilterState) {
          _age1 = state.age1!;
          _age2 = state.age2!;
        }
        if(state is ShowmeState){
          shomeGend=state.gender;
          currentIndex=state.index;
        }
        if(state is NavigateToDiacoveryState){
          _age1=double.parse(state.ageRange[0]);
          _age2=double.parse(state.ageRange[1]);
          shomeGend=state.showme;
          _currentValue=double.parse(state.maxDistance);

        }
          // TODO: implement listener
        },
        builder: (context, state) {
             if(state is  DiscoveryInitState ){
         return Center(child: CircularProgressIndicator(color: clrGreen,),);
        }
          return Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              height: mediaqueryHight(100, context),
              width: double.infinity,
              child: Column(
                children: [
                  // Distance card
                  Distance_widget(
                      appFonts: appFonts, currentValue: _currentValue),
                  SizedBox(
                    height: mediaqueryHight(.01, context),
                  ),
                  //Show me card
                  Container(
                    height: mediaqueryHight(0.15, context),
                    width: mediaqueryWidth(100, context),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: const Color.fromARGB(82, 207, 206, 206)),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Show me",
                            style: appFonts.subHeadline,
                          ),
                          SizedBox(
                            height: mediaqueryHight(.02, context),
                          ),
                          Container(
                            width: double.infinity,
                            height: 40,
                            // color: blackshadow,
                            child: ListView.builder(
                              itemCount: genderpre.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: InkWell(
                                    onTap: () {
                                      context.read<HomeblocBloc>().add(
                                          ShowmeEvent(
                                              gender: genderpre[index],
                                              index: index));
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: index == currentIndex||shomeGend==genderpre[index]
                                              ? clrGreen
                                              : whiteclr,
                                          boxShadow: [
                                            BoxShadow(
                                                blurRadius: 5,
                                                offset: Offset(0, 0))
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Center(
                                          child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 21.5, right: 21.5),
                                        child: Text(
                                          genderpre[index],
                                          style: appFonts.flextext(blackclr,
                                              size: 14, Fweight: 400),
                                        ),
                                      )),
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: mediaqueryHight(.01, context),
                  )
                  //Age card
                  ,
                  AgeCardWidget(appFonts: appFonts, age1: _age1, age2: _age2),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
