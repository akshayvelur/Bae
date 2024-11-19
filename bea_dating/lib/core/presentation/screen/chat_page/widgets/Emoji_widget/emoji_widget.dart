
import 'dart:io';

import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';

class EmojiPickerWidget extends StatelessWidget {
  const EmojiPickerWidget({
    super.key,
    required this.textController,
  });

  final TextEditingController textController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 290, // Adjusted height for emoji picker
      child: EmojiPicker(
        onEmojiSelected: (Category? category, Emoji emoji) {
          // textController.text =
          //     textController.text + emoji.emoji;
        },
        textEditingController: textController,
        config: Config(
          emojiViewConfig: EmojiViewConfig(
            emojiSizeMax:
                28 * (Platform.isIOS ? 1.30 : 1.0),
          ),
          skinToneConfig: const SkinToneConfig(),
          categoryViewConfig: const CategoryViewConfig(
          //  indicatorColor: Colors.blue,
            iconColor: Colors.grey,
            iconColorSelected:
                Color.fromARGB(255, 255, 255, 255),
          //  backspaceColor: Colors.blue,
            backgroundColor: Color(0xFFF2F2F2),
          ),
        //  bottomActionBarConfig:
             // const BottomActionBarConfig(),
         // searchViewConfig: const SearchViewConfig(),
        ),
      ),
    );
  }
}
