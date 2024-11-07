import 'package:bea_dating/core/presentation/screen/chat_page/individual_chat.dart';
import 'package:bea_dating/core/presentation/utilit/color.dart';
import 'package:bea_dating/core/presentation/utilit/fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ChatUserProfileImage extends StatelessWidget {
  const ChatUserProfileImage({
    super.key,
    required this.widget,
  });

  final IndividualChatPage widget;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 20,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: CachedNetworkImage(
          imageUrl: widget.users['image'][0],
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
          placeholder: (context, url) =>
              CircularProgressIndicator(
            color: clrGreen,
          ),
          errorWidget: (context, url, error) =>
              Icon(Icons.error_outline),
        ),
      ),
      backgroundColor: usercircle,
    );
  }
}

class ChatProfileBasicDetails extends StatelessWidget {
  const ChatProfileBasicDetails({
    super.key,
    required this.widget,
    required this.appFonts,
    required this.lastSeen,
  });

  final IndividualChatPage widget;
  final AppFonts appFonts;
  final String lastSeen;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.users['name'],
          style: appFonts.flextext(blackclr,
              Fweight: 400, size: 18),
        ),
        Text(
          widget.users['status'] == "online"
              ? "Online"
              : lastSeen,
          style: appFonts.flextext(blackshadow,
              Fweight: 400, size: 10),
        ),
      ],
    );
  }
}
