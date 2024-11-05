
import 'package:bea_dating/core/presentation/screen/home_screen/bloc/homebloc_bloc.dart';
import 'package:bea_dating/core/presentation/utilit/color.dart';
import 'package:bea_dating/core/presentation/utilit/fonts.dart';
import 'package:bea_dating/core/presentation/utilit/mediaquery.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_multi_slider/flutter_multi_slider.dart';

class AgeCardWidget extends StatelessWidget {
  const AgeCardWidget({
    super.key,
    required this.appFonts,
    required double age1,
    required double age2,
  }) : _age1 = age1, _age2 = age2;

  final AppFonts appFonts;
  final double _age1;
  final double _age2;

  @override
  Widget build(BuildContext context) {
    return Container(  height: mediaqueryHight(0.12, context),
       width: mediaqueryWidth(100, context),decoration:  BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: const Color.fromARGB(82, 207, 206, 206)),child:
               Padding(
                 padding: const EdgeInsets.all(10),
                 child: Column(children: [
         Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Text(
      "Age Range",
      style: appFonts.subHeadline,
    ),
    Text(
      "${_age1.round().toString()}-${_age2.round().toString()}",
      style:appFonts.subHeadline,
    )
                  ],
         ),
         MultiSlider(
             values: [_age1, _age2],
             max: 60,
             min: 18,
            
             color: clrGreen,
             onChanged: (value) {
           
             context.read<HomeblocBloc>().add(AgeFilterEvent(age1: value[0], age2: value[1]));
              
             },
           ) 
         ],),
               )  ,);
  }
}