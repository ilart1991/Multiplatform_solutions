import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'dart:html' as html;

import 'package:second_app/my_home_page.dart';

Widget webView() => ForWeb();

class ForWeb extends StatelessWidget {
  ForWeb() {
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory('iframe', (int viewId) {
      var iframe = html.IFrameElement();
      iframe.src = url.toString();
      return iframe;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(child: HtmlElementView(viewType: 'iframe'));
  }
}
