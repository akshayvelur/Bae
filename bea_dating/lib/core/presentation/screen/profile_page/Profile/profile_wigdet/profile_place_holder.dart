
import 'package:bea_dating/core/domin/usecase/authentication.dart';
import 'package:bea_dating/core/presentation/screen/profile_page/Profile/profile_wigdet/shimmer_widget.dart';
import 'package:bea_dating/core/presentation/utilit/color.dart';
import 'package:bea_dating/core/presentation/utilit/mediaquery.dart';
import 'package:bea_dating/core/presentation/widgets/profile_widget/profile_app_bar_widget.dart';
import 'package:flutter/material.dart';

class ProfilePlaceHolder extends StatelessWidget {
  const ProfilePlaceHolder({
    super.key,
    required this.authentic,
  });

  final Authentic authentic;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: profileAppbar(context, authentic),
      backgroundColor: whiteclr,
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                ShimmingContainer(
                  height: mediaqueryHight(.2, context),
                  width: mediaqueryWidth(.28, context),
                ),
                Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 65),
                          child: ShimmingContainer(
                            height: mediaqueryHight(.07, context),
                            width: mediaqueryWidth(.12, context),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 50),
                          child: ShimmingContainer(
                            height: mediaqueryHight(.07, context),
                            width: mediaqueryWidth(.12, context),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 65, top: 20),
                      child: ShimmingContainer(
                          width: mediaqueryWidth(.3, context),
                          height: mediaqueryHight(.045, context)),
                    )
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 27),
              child: ShimmingContainer(
                  width: mediaqueryWidth(.38, context),
                  height: mediaqueryHight(.03, context)),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18),
              child: ShimmingContainer(
                  width: mediaqueryWidth(.58, context),
                  height: mediaqueryHight(.02, context)),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 38),
              child: ShimmingContainer(
                  width: mediaqueryWidth(100, context),
                  height: mediaqueryHight(.14, context)),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: ShimmingContainer(
                  width: mediaqueryWidth(100, context),
                  height: mediaqueryHight(.27, context)),
            )
          ],
        ),
      ),
    );
  }
}
