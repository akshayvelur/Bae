  import 'package:bea_dating/core/presentation/screen/home_screen/filter_Page/discovery_settings.dart';
import 'package:bea_dating/core/presentation/utilit/color.dart';
import 'package:bea_dating/core/presentation/utilit/logo.dart';
import 'package:bea_dating/core/presentation/utilit/page_transcation/fade_transition.dart';
import 'package:flutter/material.dart';

AppBar HomePageAppBar(BuildContext context) {
    return AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            "Bae",
            style: subLogoblack,
          ),
          backgroundColor: Colors.transparent,
          actions: [
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                      FadeTransitionPageRoute(child: DiscoverySettings()));
                },
                child: Image.asset(
                  "assets/icons8-filter-100.png",
                  color: blackclr,
                  scale: 4.4,
                ))
          ],
        );
  }