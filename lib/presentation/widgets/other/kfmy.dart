// @author Matthias Weigt 02.03.23
// All rights reserved ©2023


import 'package:flutter/material.dart';

class KFMY extends StatelessWidget {
  const KFMY({super.key, required this.y});
  final double y;
  @override
  Widget build(BuildContext context) {
    return SizedBox(height: y,);
  }
}
