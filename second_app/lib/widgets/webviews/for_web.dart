import 'package:flutter/material.dart';
import 'dart:ui' as ui;
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

import 'package:second_app/my_home_page.dart';

Widget webView() => ForWeb();

class ForWeb extends StatelessWidget {
  ForWeb({super.key}) {
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory('iframe', (int viewId) {
      var iframe = html.IFrameElement();
      iframe.src = url.toString();
      return iframe;
    });
  }
  @override
  Widget build(BuildContext context) {
    return const HtmlElementView(viewType: 'iframe');
  }
}
