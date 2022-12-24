import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'package:second_app/my_home_page.dart';

Widget webView() => NonWeb();

WebViewController webController = WebViewController()
  ..setJavaScriptMode(JavaScriptMode.unrestricted)
  ..loadRequest(url);

class NonWeb extends StatelessWidget {
  @override
  Widget build(Object context) {
    return WebViewWidget(
      controller: webController,
    );
  }
}
