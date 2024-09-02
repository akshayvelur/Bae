import 'package:flutter/material.dart';

class CommonTextWidget extends StatelessWidget {
  CommonTextWidget({
    super.key,
    required this.textfont,required this.text
  });

  final textfont;
  final text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: textfont
    );
  }
}