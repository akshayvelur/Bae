
import 'package:bea_dating/core/presentation/utilit/color.dart';
import 'package:bea_dating/core/presentation/utilit/fonts.dart';
import 'package:bea_dating/core/presentation/utilit/mediaquery.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/homebloc_bloc.dart';

class Distance_widget extends StatelessWidget {
  const Distance_widget({
    super.key,
    required this.appFonts,
    required double currentValue,
  }) : _currentValue = currentValue;

  final AppFonts appFonts;
  final double _currentValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: mediaqueryHight(0.12, context),
      width: mediaqueryWidth(100, context),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: const Color.fromARGB(82, 207, 206, 206)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Maximum Distance",
                  style: appFonts.subHeadline,
                ),
                Text(
                  "${_currentValue.round().toString()}.km",
                  style: appFonts.subHeadline,
                )
              ],
            ),
          ),
          Slider(
            value: _currentValue,
            secondaryActiveColor: whiteclr,
            divisions: null,
            activeColor: clrGreen,
            max: 500,
            onChanged: (value) {
              context.read<HomeblocBloc>().add(
                  DistanceFilterSliderEvent(distance: value));
            },
          )
        ],
      ),
    );
  }
}
