

import 'package:bea_dating/core/presentation/utilit/color.dart';
import 'package:bea_dating/core/presentation/utilit/logo.dart';
import 'package:flutter/material.dart';
// ignore: unnecessary_import
import 'package:flutter/widgets.dart';

class AppBarwidget extends StatelessWidget {
  const AppBarwidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(backgroundColor: whiteclr,
      automaticallyImplyLeading: false,
      title: Text(
        "Bae",
        style: subLogoblack,
      ),
    );
  }
}
