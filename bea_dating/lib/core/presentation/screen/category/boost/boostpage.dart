import 'package:bea_dating/core/presentation/screen/category/boost/razorpay_page.dart';
import 'package:bea_dating/core/presentation/screen/category/boost/widget/cards.dart';
import 'package:bea_dating/core/presentation/utilit/color.dart';
import 'package:bea_dating/core/presentation/utilit/fonts.dart';
import 'package:bea_dating/core/presentation/utilit/mediaquery.dart';
import 'package:bea_dating/core/presentation/utilit/page_transcation/fade_transition.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:developer';

// ignore: must_be_immutable
class BoostPage extends StatefulWidget {
  BoostPage({super.key});

  @override
  State<BoostPage> createState() => _BoostPageState();
}

class _BoostPageState extends State<BoostPage> {
  AppFonts appFonts = AppFonts(); 
  late Razorpay _razorpay;
  TextEditingController amountController = TextEditingController();

  void openCheckOut(amount) async {
    amount = amount * 100;
    var options = {
      "key": 'rzp_test_xpNEcBCPolyoDm',
      'amount': amount,
      'name': 'Bae',
      'prefill': {'contact': '123456789', 'email': 'testgmail.com'},
      'external': {
        'wallet': ['paytm']
      }
    };
    try {
      _razorpay.open(options);
    } catch (e) {
      log("razorpay Error :${e}");
    }
  }

  void handlePaymentSuccess(PaymentSuccessResponse response,int amoount) {
    Fluttertoast.showToast(
        msg: "Payment Succesful" + response.paymentId!,
        toastLength: Toast.LENGTH_SHORT);
  }

  void handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(
        msg: "Payment Fail" + response.message!,
        toastLength: Toast.LENGTH_SHORT);
  }

  void handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(
        msg: "External Wallet" + response.walletName!,
        toastLength: Toast.LENGTH_SHORT);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _razorpay = Razorpay();
       
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handlePaymentSuccess);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _razorpay.clear();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFFFCC80),
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 300, top: 35),
                child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      "assets/icons8-cancel-100.png",
                      scale: 2,
                    )),
              ),
              Text(
                "Boots",
                style: appFonts.flextext(blackclr, size: 28, Fweight: 700),
              ),
              Container(
                height: mediaqueryHight(.065, context),
                width: mediaqueryWidth(.13, context),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: blackclr,
                    image: DecorationImage(
                      image: AssetImage("assets/icons8-power-48.png"),
                      scale: 1.5,
                    )),
              ),
              SizedBox(
                height: mediaqueryHight(.04, context),
              ),
              Text(
                "Boost your profile",
                style: appFonts.flextext(blackclr, Fweight: 700, size: 23),
              ),
              SizedBox(
                height: mediaqueryHight(.03, context),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Text(
                  "Multiply your changes of being liked and",
                  style: appFonts.flextext(blackclr, Fweight: 300, size: 18),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Text("get more Crushes!",
                    style: appFonts.flextext(blackclr, Fweight: 300, size: 18)),
              ),
              SizedBox(
                height: mediaqueryHight(.03, context),
              ),
              Row(
                children: [
                  // card one
                  InkWell(
                      onTap: () {
                          openCheckOut(475);
                        // Navigator.of(context).push(FadeTransitionPageRoute(child: RazorpayPage()))
                        // ;
                        },
                      splashColor: const Color.fromARGB(162, 125, 96, 139),
                      borderRadius: BorderRadius.circular(10),
                      child: Ink(child: CardOne(appFonts: appFonts))),
                  // card two
                  InkWell(
                      onTap: () {
                          openCheckOut(189);
                      },
                      splashColor: const Color.fromARGB(162, 125, 96, 139),
                      borderRadius: BorderRadius.circular(10),
                      child: Ink(child: CardTwo(appFonts: appFonts))),
                  // card three
                  InkWell(
                      onTap: () {
                             openCheckOut(89);
                      },
                      splashColor: const Color.fromARGB(162, 125, 96, 139),
                      borderRadius: BorderRadius.circular(10),
                      child: Ink(child: CardThree(appFonts: appFonts))),
                ],
              ),
              SizedBox(
                height: mediaqueryHight(.15, context),
              ),
              // Container(
              //     height: mediaqueryHight(.05, context),
              //     width: mediaqueryWidth(.85, context),
              //     decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(15), color: blackclr),
              //     child: TextButton(onPressed: () {}, child: Text("Continue",style: appFonts.flextext(whiteclr,size: 16,Fweight: 500),)))
            ],
          ),
        ));
  }
}
