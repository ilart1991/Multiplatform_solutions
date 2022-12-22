import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' show parse;

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController controller = TextEditingController();

  Uri url = Uri.https('flutter.dev');
  String body = "";
  String title = "";

  getData() {
    var response = http.get(url);
    response.then((value) {
      body = value.body;
      if (body.contains("<title>")) {
        title = parse(body).getElementsByTagName("title")[0].innerHtml;
        final pattern = RegExp('\\s+');
        title = title.replaceAll(pattern, ' ');
        if (title[0] == ' ') {
          title = title.substring(1, title.length);
        }
        if (title[title.length - 1] == ' ') {
          title = title.substring(0, title.length - 1);
        }
      }
    });
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
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        title,
                        style: const TextStyle(
                            fontSize: 28, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const Expanded(
                    flex: 2,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("CORS Header: None"),
                    ),
                  ),
                  Expanded(
                    flex: 12,
                    child: Text("web"),
                  ),
                  Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: controller,
                          decoration: InputDecoration(
                            suffix: MaterialButton(
                                child: const Text("LOAD"),
                                onPressed: () {
                                  setState(() {
                                    url = Uri.https(controller.text);
                                    getData();
                                  });
                                }),
                            border: const UnderlineInputBorder(),
                            labelText: 'URL',
                          ),
                        ),
                      )),
                  Expanded(
                      flex: 2,
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(
                                "Application running on ${kIsWeb ? 'web' : Platform.operatingSystem}"
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
