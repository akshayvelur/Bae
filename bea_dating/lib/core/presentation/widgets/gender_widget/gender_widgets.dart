
import 'package:bea_dating/core/presentation/block/user_details_bloc.dart';
import 'package:bea_dating/core/presentation/utilit/color.dart';
import 'package:bea_dating/core/presentation/utilit/fonts.dart';
import 'package:bea_dating/core/presentation/utilit/mediaquery.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class GenderWidgetTwo extends StatelessWidget {
  GenderWidgetTwo({
    super.key,
    required this.menclr,
    required this.appFonts,required this. cat
  });

  final Color menclr;
  final AppFonts appFonts;
  String cat;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<UserDetailsBloc>().add(
            GenderButtonSelctionEvent(
                menclr: blackclr,
                Otherclr: whiteclr,
                womenclr: whiteclr,
                gender: cat));
      },
      child: Container(
        height: mediaqueryHight(.05, context),
        width: mediaqueryWidth(100, context),
        decoration: BoxDecoration(
            color: menclr,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  color: blackclr, blurRadius: 2)
            ]),
        child: Center(
            child: Text(
          cat,
          style: appFonts.nextbuttongreen,
        )),
      ),
    );
  }
}

// ignore: must_be_immutable
class GenderWidgetOne extends StatelessWidget {
   GenderWidgetOne({
    super.key,
    required this.women,
    required this.appFonts,required this.cat
  });

  final Color women;
  final AppFonts appFonts;
  String cat;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<UserDetailsBloc>().add(
            GenderButtonSelctionEvent(
                menclr:whiteclr,
                Otherclr: whiteclr,
                womenclr:blackclr,
                gender: cat));
      },
      child: Container(
        height: mediaqueryHight(.05, context),
        width: mediaqueryWidth(100, context),
        decoration: BoxDecoration(
            color: women,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  color:blackclr, blurRadius: 2)
            ]),
        child: Center(
            child: Text(
          cat,
          style: appFonts.nextbuttongreen,
        )),
      ),
    );
  }
}

// ignore: must_be_immutable
class GenderWidgetThree extends StatelessWidget {
   GenderWidgetThree({
    super.key,
    required this.other,
    required this.appFonts,required this.cat
  });

  final Color other;
  final AppFonts appFonts;
  String cat;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<UserDetailsBloc>().add(
            GenderButtonSelctionEvent(
                menclr: whiteclr,
                Otherclr:blackclr,
                womenclr:whiteclr,
                gender: cat));
      },
      child: Container(
        height: mediaqueryHight(.05, context),
        width: mediaqueryWidth(100, context),
        decoration: BoxDecoration(
            color: other,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  color:blackclr, blurRadius: 2)
            ]),
        child: Center(
            child: Text(
          cat,
          style: appFonts.nextbuttongreen,
        )),
      ),
    );
  }
}

///
// ignore: must_be_immutable
class InterestWidgetOne extends StatelessWidget {
  InterestWidgetOne({
    super.key,
    required this.menclr,
    required this.appFonts,required this. cat
  });

  final Color menclr;
  final AppFonts appFonts;
  String cat;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<UserDetailsBloc>().add(
           InterestButtonSelctionEvent(
                menclr: blackclr,
                Otherclr: whiteclr,
                womenclr: whiteclr,
                gender: cat));
      },
      child: Container(
        height: mediaqueryHight(.05, context),
        width: mediaqueryWidth(100, context),
        decoration: BoxDecoration(
            color: menclr,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  color: blackclr, blurRadius: 2)
            ]),
        child: Center(
            child: Text(
          cat,
          style: appFonts.nextbuttongreen,
        )),
      ),
    );
  }
}

// ignore: must_be_immutable
class InterestWidgetTwo extends StatelessWidget {
   InterestWidgetTwo({
    super.key,
    required this.women,
    required this.appFonts,required this.cat
  });

  final Color women;
  final AppFonts appFonts;
  String cat;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<UserDetailsBloc>().add(
            InterestButtonSelctionEvent(
                menclr:whiteclr,
                Otherclr: whiteclr,
                womenclr:blackclr,
                gender: cat));
      },
      child: Container(
        height: mediaqueryHight(.05, context),
        width: mediaqueryWidth(100, context),
        decoration: BoxDecoration(
            color: women,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  color:blackclr, blurRadius: 2)
            ]),
        child: Center(
            child: Text(
          cat,
          style: appFonts.nextbuttongreen,
        )),
      ),
    );
  }
}

// ignore: must_be_immutable
class InterestWidgetThree extends StatelessWidget {
   InterestWidgetThree({
    super.key,
    required this.other,
    required this.appFonts,required this.cat
  });

  final Color other;
  final AppFonts appFonts;
  String cat;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<UserDetailsBloc>().add(
            InterestButtonSelctionEvent(
                menclr: whiteclr,
                Otherclr:blackclr,
                womenclr:whiteclr,
                gender: cat));
      },
      child: Container(
        height: mediaqueryHight(.05, context),
        width: mediaqueryWidth(100, context),
        decoration: BoxDecoration(
            color: other,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  color:blackclr, blurRadius: 2)
            ]),
        child: Center(
            child: Text(
          cat,
          style: appFonts.nextbuttongreen,
        )),
      ),
    );
  }
}

