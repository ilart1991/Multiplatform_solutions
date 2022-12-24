import 'dart:io' as io;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:second_app/widgets/my_textfield.dart';
import 'package:second_app/widgets/my_title.dart';

import 'package:second_app/widgets/webviews/stub.dart'
    if (dart.library.html) "package:second_app/widgets/webviews/for_web.dart"
    if (dart.library.io) "package:second_app/widgets/webviews/for_non_web.dart";

Uri url = Uri.https('flutter.dev');

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  getData() {
    var response = http.get(url);
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done &&
                snapshot.hasData) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const MyTitle(),
                  const Expanded(
                    flex: 2,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("CORS Header: None"),
                    ),
                  ),
                  Expanded(flex: 12, child: webView()),
                  const MyTextField(),
                  Expanded(
                      flex: 2,
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(
                                "Application running on ${kIsWeb ? 'web' : io.Platform.operatingSystem}"
                                    .toUpperCase()),
                          ))),
                ],
              );
            } else if (snapshot.connectionState == ConnectionState.done &&
                !snapshot.hasData) {
              return Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                      "Error loading body for $url. Please, input another url"),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MaterialButton(
                        child: const Text("BACK TO HOME"),
                        onPressed: () {
                          setState(() {
                            url = Uri.https('flutter.dev');
                          });
                        }),
                  )
                ],
              ));
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
