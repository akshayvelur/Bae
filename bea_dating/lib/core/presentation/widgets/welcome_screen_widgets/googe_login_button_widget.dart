
import 'package:animated_loading_border/animated_loading_border.dart';
import 'package:bea_dating/core/presentation/screen/user_inital_data/block/user_details_bloc.dart';
import 'package:bea_dating/core/presentation/utilit/color.dart';
import 'package:bea_dating/core/presentation/utilit/fonts.dart';
import 'package:bea_dating/core/presentation/utilit/mediaquery.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GoogleLoginButtonWidget extends StatelessWidget {
  const GoogleLoginButtonWidget({
    super.key,
    required this.appFonts,
  });

  final AppFonts appFonts;

  @override
  Widget build(BuildContext context) {
    return Center(
      // Navigate to Next page
      child: InkWell(
        onTap: () async{
          context.read<UserDetailsBloc>().add(GoogleLoginEvent());
       
        },
        child: AnimatedLoadingBorder(borderWidth: 4,borderColor: whiteclr,cornerRadius: 30,duration: Duration(seconds: 4),
          child: Container(
            height: mediaqueryHight(.05, context),
            width: mediaqueryWidth(.86, context),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      blurRadius: 2,
                      color: Color.fromARGB(255, 0, 0, 0),
                      blurStyle: BlurStyle.outer,
                      offset: Offset(0, 1))
                ]),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: mediaqueryWidth(.03, context),
                  ),
                  Container(
                      width: mediaqueryWidth(.08, context),
                      height: mediaqueryHight(.05, context),
                      child: Image(
                          image: AssetImage("assets/pngwing.com.png"))),
                  SizedBox(
                    width: mediaqueryWidth(.15, context),
                  ),
                
                  Text(
                    "Sign in with Google",
                    style: appFonts.nextbuttongreen,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
