import 'package:bea_dating/core/presentation/screen/chat_page/bloc/chat_bloc.dart';
import 'package:bea_dating/core/presentation/screen/chat_page/individual_chat.dart';
import 'package:bea_dating/core/presentation/utilit/color.dart';
import 'package:bea_dating/core/presentation/utilit/fonts.dart';
import 'package:bea_dating/core/presentation/utilit/mediaquery.dart';
import 'package:bea_dating/core/presentation/utilit/page_transcation/fade_transition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatPage extends StatelessWidget {
  ChatPage({super.key});
  AppFonts appFonts = AppFonts();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChatBloc, ChatState>(
      listener: (context, state) {
        if(state is NavigateToIndividualState){
          Navigator.of(context).push(FadeTransitionPageRoute(child:IndividualChatPage()));
        }
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: whiteclr,
          appBar: AppBar(
            title: Text(
              "chat",
              style: appFonts.appBarfont,
            ),
            centerTitle: true,
            automaticallyImplyLeading: false,
          ),
          body: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "New Matches",
                  style: appFonts.subHeadline,
                ),
                SizedBox(
                  height: mediaqueryHight(.01, context),
                ),
                Container(
                  // color: Color.fromRGBO(151, 151, 150, 0.749),
                  height: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 7,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {},
                          splashColor: blackshadow,
                          borderRadius: BorderRadius.circular(10),
                          child: Center(
                            child: Column(
                              children: [
                                CircleAvatar(
                                  backgroundColor: usercircle,
                                  radius: 30,
                                ),
                                SizedBox(
                                  height: mediaqueryHight(.005, context),
                                ),
                                Container(
                                  height: 15,
                                  width: 50,
                                  color: useraboutContainer,
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: mediaqueryHight(.01, context),
                ),
                Text(
                  "Messages",
                  style: appFonts.subHeadline,
                ),
                SizedBox(
                  height: mediaqueryHight(.01, context),
                ),
                Container(
                  height: 495,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromARGB(78, 136, 156, 155),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: ListView.separated(
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: InkWell(
                              onTap: () {
                                context.read<ChatBloc>().add(IndividualEvent());
                                //Individual chat Inkwell
                              },
                              splashColor: blackshadow,
                              borderRadius: BorderRadius.circular(10),
                              child: Ink(
                                child: Container(
                                    height: mediaqueryHight(.08, context),
                                    child: Center(
                                        child: ListTile(
                                      leading: CircleAvatar(
                                        radius: 30,
                                        backgroundColor: usercircle,
                                      ),
                                      contentPadding: EdgeInsets.zero,
                                      title: Container(
                                        height: 20,
                                        color: usercircle,
                                      ),
                                    ))),
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 70, right: 10),
                            child: Container(
                              height: mediaqueryHight(.0002, context),
                              color: blackshadow,
                            ),
                          );
                        }),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
