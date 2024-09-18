import 'package:bea_dating/core/presentation/utilit/color.dart';
import 'package:bea_dating/core/presentation/utilit/mediaquery.dart';
import 'package:flutter/widgets.dart';

class myContainer extends StatelessWidget {
  const myContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: mediaqueryHight(.035, context),
      width: mediaqueryWidth(.4, context),decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: blackshadow,),
      );
  }
}