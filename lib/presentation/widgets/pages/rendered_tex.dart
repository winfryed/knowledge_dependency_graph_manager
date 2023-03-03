// @author Matthias Weigt 02.03.23
// All rights reserved ©2023

import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';

class RenderedTex extends StatelessWidget {
  const RenderedTex({super.key, required this.text, this.textStyle});

  final String text;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return _compile(text, textStyle, context);
  }

  Widget _compile(String text,TextStyle? textStyle,BuildContext context) {

    // bool textStartsWithDolloar = text.startsWith("\$");

    TextStyle? defaultStyle = Theme.of(context).textTheme.bodyLarge;
    if(text.isEmpty) {
      return SizedBox();
    }
    List<String> elements = text.split("\$");

    print(elements);

    List<InlineSpan> spans = [];

    for(int i = 0;i<elements.length;i++) {
      if(i.isEven) {
        spans.add(TextSpan(text:elements[i],style: defaultStyle,));
      } else {
        spans.add(WidgetSpan(alignment: PlaceholderAlignment.middle,child: Math.tex(elements[i],textStyle: defaultStyle,mathStyle: MathStyle.display,)));
      }

    }


    return RichText(text: TextSpan(children: spans));


    return Text(text);

  }
}



