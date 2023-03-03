// @author Matthias Weigt 02.03.23
// All rights reserved ©2023

import 'package:flutter/material.dart';

class KFMCardWithColumn extends StatelessWidget {
  const KFMCardWithColumn(
      {super.key, required this.children, this.width, this.height});

  final List<Widget> children;

  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: width,height: height,
      child: Card(
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: children,
          ),
        ),
      ),
    );
  }
}
