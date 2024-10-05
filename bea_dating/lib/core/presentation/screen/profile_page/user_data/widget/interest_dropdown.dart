
import 'package:bea_dating/core/presentation/screen/profile_page/user_data/bloc/user_upload_bloc.dart';
import 'package:bea_dating/core/presentation/utilit/color.dart';
import 'package:bea_dating/core/presentation/utilit/fonts.dart';
import 'package:bea_dating/core/presentation/utilit/mediaquery.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InterestDropDown extends StatelessWidget {
  const InterestDropDown({
    super.key,
    required this.dropdownValue,
    required this.dropitem,
    required this.appFonts,
  });

  final String dropdownValue;
  final List<String> dropitem;
  final AppFonts appFonts;

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
