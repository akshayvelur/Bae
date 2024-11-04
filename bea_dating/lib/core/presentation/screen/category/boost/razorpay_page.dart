// import 'dart:developer';
// import 'dart:ffi';
// import 'package:bea_dating/core/presentation/utilit/color.dart';
// import 'package:bea_dating/core/presentation/utilit/fonts.dart';
// import 'package:razorpay_flutter/razorpay_flutter.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';

// class RazorpayPage extends StatefulWidget {
//   const RazorpayPage({super.key});

//   @override
//   State<RazorpayPage> createState() => _RazorpayPageState();
// }

// class _RazorpayPageState extends State<RazorpayPage> {
//   late Razorpay _razorpay;
//   AppFonts appFonts = AppFonts();
//   TextEditingController amountController = TextEditingController();

//   void openCheckOut(amount) async {
//     amount = amount * 100;
//     var options = {
//       "key": 'rzp_test_xpNEcBCPolyoDm',
//       'amount': amount,
//       'name': 'Bae',
//       'prefill': {'contact': '123456789', 'email': 'testgmail.com'},
//       'external': {
//         'wallet': ['paytm']
//       }
//     };
//     try {
//       _razorpay.open(options);
//     } catch (e) {
//       log("razorpay Error :${e}");
//     }
//   }

//   void handlePaymentSuccess(PaymentSuccessResponse response) {
//     Fluttertoast.showToast(
//         msg: "Payment Succesful" + response.paymentId!,
//         toastLength: Toast.LENGTH_SHORT);
//   }

//   void handlePaymentError(PaymentFailureResponse response) {
//     Fluttertoast.showToast(
//         msg: "Payment Fail" + response.message!,
//         toastLength: Toast.LENGTH_SHORT);
//   }

//   void handleExternalWallet(ExternalWalletResponse response) {
//     Fluttertoast.showToast(
//         msg: "External Wallet" + response.walletName!,
//         toastLength: Toast.LENGTH_SHORT);
//   }

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _razorpay = Razorpay();
//          openCheckOut(120);
//     _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccess);
//     _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentError);
//     _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handlePaymentSuccess);
//   }

//   @override
//   void dispose() {
//     // TODO: implement dispose
//     super.dispose();
//     _razorpay.clear();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey,
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             SizedBox(
//               height: 100,
//             ),
//             Image.network(
//               "https://uploads.vw-mms.de/system/production/images/vwn/030/145/images/7a0d84d3b718c9a621100e43e581278433114c82/DB2019AL01950_web_1600.jpg?1649155356",
//               width: 100,
//               height: 300,
//             ),
//             SizedBox(
//               height: 10,
//             ),

//                  Text(
//                   "Welcome to Razorpay Payment Gateway Integration ",
//                   style: appFonts.flextext(whiteclr,Fweight: 400,size: 10),
//                 ),
//                 SizedBox(height: 30,),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: TextFormField(
//                     cursorColor: whiteclr,autofocus: false,
//                     style: appFonts.flextext(whiteclr,Fweight: 400,size: 14),
//                     decoration: InputDecoration(labelText: "Enter Amount to be paid",
//                     labelStyle: appFonts.flextext(whiteclr,Fweight: 400,size: 14),
//                     border:OutlineInputBorder(borderSide: BorderSide(color: whiteclr,width: 1.0))
//                     ,enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: whiteclr,width: 1.0)) 
//                     ,errorStyle:appFonts.flextext(clrRed,Fweight: 400,size: 14) ),
//                   controller: amountController,
//                   validator: (value) {
//                     if(value==null||value.isEmpty){
//                    return "Please Enter Amount to be Paid" ;
//                     }
//                     return null;
//                   },
//                   ),
//                 ),SizedBox(height: 30,),
//                 ElevatedButton(onPressed: (){
//                   if(amountController.text.isNotEmpty){
//                     setState(() {
//                       int amount=int.parse(amountController.text);
//                       openCheckOut(amount);
//                     });
//                   }
//                 }, child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Text("Make Payment",),
//                 ),
//                )

//           ],
//         ),
//       ),
//     );
//   }
// }
