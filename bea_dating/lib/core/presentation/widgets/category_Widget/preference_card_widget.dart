
import 'package:bea_dating/core/presentation/screen/category/category_cardview.dart';
import 'package:bea_dating/core/presentation/utilit/color.dart';
import 'package:bea_dating/core/presentation/utilit/fonts.dart';
import 'package:bea_dating/core/presentation/utilit/mediaquery.dart';
import 'package:bea_dating/core/presentation/utilit/page_transcation/fade_transition.dart';
import 'package:flutter/material.dart';

class PreferenceCardWidget extends StatelessWidget {
  const PreferenceCardWidget({
    super.key,
    required this.exploreimg,
    required this.appFonts,
  });

  final Map<String, String> exploreimg;
  final AppFonts appFonts;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: GridView.builder(
        itemCount: 8,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: 210,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        itemBuilder: (context, index) {
          return InkWell(onTap: () {Navigator.of(context).push(FadeTransitionPageRoute(child: CategoryViewScreen(catId: exploreimg.keys.elementAt(index) )));
            
          },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(blurRadius: 2, color: blackclr)
                  ],
                  image: DecorationImage(
                      image: AssetImage(
                        exploreimg.values.elementAt(index),
                      ),
                      fit: BoxFit.cover)),
              child: Center(
                  child: Padding(
                padding: const EdgeInsets.only(top: 130),
                child: Container(
                    width: mediaqueryWidth(.36, context),
                    child: Text(
                      exploreimg.keys.elementAt(index),
                      style:
                          appFonts.flextext(whiteclr, size: 20),
                    )),
              )),
            ),
          );
        },
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
      ),
    );
  }
}
