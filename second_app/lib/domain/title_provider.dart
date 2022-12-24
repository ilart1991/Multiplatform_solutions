import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' show parse;

class TitleProvider with ChangeNotifier {
  String pageTitle = "Build apps for any screen";

  setTitle(String body, Uri url) {
    var response = http.get(url);
    response.then((value) {
      body = value.body;
      if (body.contains("<title>")) {
        pageTitle = parse(body).getElementsByTagName("title")[0].innerHtml;
        final pattern = RegExp('\\s+');
        pageTitle = pageTitle.replaceAll(pattern, ' ');
        if (pageTitle[0] == ' ') {
          pageTitle = pageTitle.substring(1, pageTitle.length);
        }
        if (pageTitle[pageTitle.length - 1] == ' ') {
          pageTitle = pageTitle.substring(0, pageTitle.length - 1);
        }
        notifyListeners();
      }
    });
    return pageTitle;
  }
}
