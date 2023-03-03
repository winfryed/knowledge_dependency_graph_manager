// @author Matthias Weigt 02.03.23
// All rights reserved ©2023

import 'package:flutter/material.dart';

class KFMTextField extends StatelessWidget {
  const KFMTextField(
      {super.key, required this.controller, this.width, this.hintText, this.onChanged});

  final TextEditingController controller;
  final double? width;
  final String? hintText;
  final void Function(String text)? onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: TextField(maxLines: 5,
          controller: controller,onChanged: onChanged,
          decoration: InputDecoration(hintText: hintText)),
    );
  }
}
