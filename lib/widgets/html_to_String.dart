import 'package:flutter/cupertino.dart';
import 'package:html/parser.dart';

String parseHtmlString(String htmlString) {
  var document = parse(htmlString.replaceAll('<p>', "\n\n"));

  String parsedString = parse(document.body.text).documentElement.text;

  return parsedString.splitMapJoin(
      RegExp(
          r"(http(s)?:\/\/.)?(www\.)?[-a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-z]{2,6}\b([-a-zA-Z0-9@:%_\+.~#?&//=]*)"),
      onMatch: (m) {
    String text = '"${m.group(0)}"';
    return text;
  });
}
// onNonMatch: (n) => '[${n}]');;

// String result = 'bezkoder2019.com'.splitMapJoin(
//   RegExp(r'[0-9]+'),
//   onMatch: (m) => '_${m.group(0)}_',
//   onNonMatch: (n) => '[${n}]');
