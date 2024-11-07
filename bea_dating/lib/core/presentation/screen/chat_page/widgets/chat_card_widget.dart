
import 'package:bea_dating/core/presentation/screen/chat_page/image_view.dart';
import 'package:bea_dating/core/presentation/utilit/color.dart';
import 'package:bea_dating/core/presentation/utilit/fonts.dart';
import 'package:bea_dating/core/presentation/utilit/mediaquery.dart';
import 'package:bea_dating/core/presentation/utilit/page_transcation/fade_transition.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ChatCard extends StatelessWidget {
  const ChatCard({
    super.key,
    required this.isSender,
    required this.msgType,
    required this.msg,
    required this.appFonts,
    required this.time,
  });

  final bool isSender;
  final String msgType;
  final String msg;
  final AppFonts appFonts;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: isSender
            ? Alignment.centerRight
            : Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.only(
              left: 10,
              right: 10,
              top: 5,
              bottom: 5),
          child: ConstrainedBox(
            constraints: BoxConstraints(
                maxWidth: 250),
            child: Container(
                decoration: isSender
                    ? BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft:
                                Radius.circular(
                                    15),
                            topLeft:
                                Radius.circular(
                                    15),
                            topRight:
                                Radius.circular(
                                    15)),
                        color: chatIconClr)
                    : BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomRight:
                                Radius.circular(
                                    15),
                            topLeft:
                                Radius.circular(
                                    15),
                            topRight:
                                Radius.circular(
                                    15)),
                        color: blackshadow),
                child: Padding(
                  padding:
                      const EdgeInsets.only(
                          left: 13,
                          right: 13,
                          top: 13,
                          bottom: 6),
                  child: Column(
                    crossAxisAlignment: isSender
                        ? CrossAxisAlignment
                            .end
                        : CrossAxisAlignment
                            .start,
                    mainAxisAlignment:
                        MainAxisAlignment
                            .spaceBetween,
                    children: [
                      msgType == "text"
                          ? Text(
                              msg,
                              style: isSender
                                  ? appFonts.flextext(
                                      blackclr,
                                      Fweight:
                                          400,
                                      size:
                                          14)
                                  : appFonts.flextext(
                                      whiteclr,
                                      Fweight:
                                          400,
                                      size:
                                          14),
                            )
                          : InkWell(
                              onTap: () {
                                Navigator.of(
                                        context)
                                    .push(FadeTransitionPageRoute(
                                        child:
                                            ImageViewPage(image: msg)));
                              },
                              child: Container(
                                  height: mediaqueryHight(.35, context),
                                  width: mediaqueryWidth(.5, context),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: CachedNetworkImage(
                                        imageUrl:
                                            msg,
                                        fit:
                                            BoxFit.cover,
                                        width:
                                            double.infinity,
                                        height:
                                            double.infinity,
                                        placeholder: (context, url) =>
                                            Center(
                                          child: CircularProgressIndicator(
                                            color: clrGreen,
                                          ),
                                        ),
                                        errorWidget: (context, url, error) =>
                                            Icon(Icons.error),
                                      ))),
                            ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        time,
                        style: isSender
                            ? appFonts.flextext(
                                blackshadow,
                                Fweight:
                                    400,
                                size: 10)
                            : appFonts.flextext(
                                const Color
                                    .fromARGB(
                                    170,
                                    255,
                                    255,
                                    255),
                                Fweight:
                                    400,
                                size: 10),
                      )
                    ],
                  ),
                )),
          ),
        ));
  }
}
