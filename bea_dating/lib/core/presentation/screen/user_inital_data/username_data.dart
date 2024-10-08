
import 'package:bea_dating/core/presentation/screen/User_inital_data/User_dob.dart';
import 'package:bea_dating/core/presentation/screen/user_inital_data/block/user_details_bloc.dart';
import 'package:bea_dating/core/presentation/utilit/color.dart';
import 'package:bea_dating/core/presentation/utilit/fonts.dart';
import 'package:bea_dating/core/presentation/utilit/mediaquery.dart';
import 'package:bea_dating/core/presentation/utilit/page_transcation/fade_transition.dart';
import 'package:bea_dating/core/presentation/widgets/backbutton/back_button.dart';
import 'package:bea_dating/core/presentation/widgets/userintroduction/User_greenbutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class UserName extends StatelessWidget {
  UserName({super.key});

  AppFonts appFonts = AppFonts();
  final formKey = GlobalKey<FormState>();
  TextEditingController usernamecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: BlocListener<UserDetailsBloc, UserDetailsState>(
        listener: (context, state) {
          if (state is NavigateToDobState) {
            Navigator.of(context)
                .push(FadeTransitionPageRoute(child: UserDob()));
          }
        },
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          body: SingleChildScrollView(
            child: Container(
              width: mediaqueryWidth(100, context),
              decoration: BoxDecoration(color: whiteclr),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: mediaqueryHight(.05, context),
                    ),
                    // Page back navigation
                    InkWell(
                        onTap: () async {
                          FocusScope.of(context).unfocus();
                          await Future.delayed(
                              const Duration(milliseconds: 250));
                          Navigator.pop(context);
                        },
                        child: const Backbuttons()),
                    SizedBox(
                      height: mediaqueryHight(.05, context),
                    ),
                    Text("What's your name?", style: appFonts.commonheadfont),
                    SizedBox(
                      height: mediaqueryHight(.02, context),
                    ),
                    Form(
                      key: formKey,
                      child: TextFormField(autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: usernamecontroller,
                        decoration: InputDecoration(
                            labelText: "Name",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            )),
                        validator: (value) {
                          if(value==null||value.isEmpty){
                        return "Enter your name";
                          }else{
                            return null;
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      height: mediaqueryHight(.56, context),
                    ),
                    Center(
                      // Navigate to Next page
                      child: GestureDetector(
                        onTap: () {
                          if(formKey.currentState!.validate()){
                                 context.read<UserDetailsBloc>().add(NameToDobEvent(
                              userName: usernamecontroller.text));
                          }
                      
                        },
                        child: GreenNextbutton(
                          appFonts: appFonts,
                          content: "Next",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
