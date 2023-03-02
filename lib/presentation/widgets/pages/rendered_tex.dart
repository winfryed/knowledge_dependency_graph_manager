// @author Matthias Weigt 02.03.23
// All rights reserved ©2023

import 'package:flutter/material.dart';

class RenderedTex extends StatelessWidget {
  const RenderedTex({super.key, required this.text, required this.textStyle});

  final String text;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Text(text);
  }

  RichText _compile(String text,TextStyle? textStyle,BuildContext context) {
    throw UnimplementedError();
  }
}
