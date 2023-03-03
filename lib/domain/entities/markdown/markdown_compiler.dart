// @author Yuri Hassink 02.03.2023
// All rights reserved ©2023

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';

//TODO
///converts compiled diverse text forms to a RichText format
RichText compiledToRichText(List<List<String>> input, BuildContext context,TextStyle? textStyle){
  List<dynamic> cacheList=[];
  List<InlineSpan> returnList = [];
  TextStyle? style = Theme.of(context).textTheme.headlineMedium;

  if (textStyle != null){
    style = textStyle;
  }

  int j = 0;
  for (List<String> syntaxList in input){
    //process each syntax style
    int i =0;
    for (String s in syntaxList){
      if (i.isEven){
        if (j==0){
          cacheList.add(TextSpan(text: s, style: Theme.of(context).textTheme.displayLarge));
        } else if (j==1){
          cacheList.add(TextSpan(text: s, style: const TextStyle(fontWeight: FontWeight.bold)));
        } else if (j==2){
          cacheList.add(WidgetSpan(
            child: Math.tex(s,
                mathStyle: MathStyle.text),
                style: style,
          ));
        }
      } else {
        //further parsing here
        cacheList.add(s);
      }
      ++i;
    }
    ++j;
  }

  return RichText(
      text: TextSpan(children: returnList));
}

/// list of syntaxes for this markdown compiler, identified by their index,
/// signify entry and escape sequence, if something here is changed, it should also be
/// changed in the above if statement
final List<String> _syntaxList= [
  "#",
  "*",
  r"$",
];

String _testString= r"this is a test string $latex is in here$ here we have string again #heading# string *bold text*";
/// result:
/// [[this is a test string $latex is in here$ here we have string again , heading,  string *bold text*],
/// [this is a test string $latex is in here$ here we have string again #heading# string , bold text, ],
/// [this is a test string , latex is in here,  here we have string again #heading# string *bold text*]]

//TODO
///compiler for a limited markdown editor
/// output: list with length of _syntaxList that contains list split in order of syntaxes
List<List<String>> compileMarkdown(String input){
  List<List<String>> resultElements=[];
  List<int> resultParallelIndexOfSyntax = [];
  List<dynamic> cacheList = [];
  List<String> stringCacheList = [];

  cacheList = input.split(_syntaxList[0]);
  if (cacheList.length.isEven) {
    throw Exception("escape syntax for markdown incorrect");
  }

  for (int j=1;j<_syntaxList.length;++j){
    int j = 0;
    for (String v in cacheList){
      if (j.isOdd){
        stringCacheList.addAll(v.split(_syntaxList[j]));
      }
      ++j;
    }
    if (cacheList.length.isEven){
      throw Exception("escape syntax for markdown incorrect");
    }
  }
  return resultElements;
}

