import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_app/widgets/webviews/for_non_web.dart';
import '../domain/title_provider.dart';
import '../my_home_page.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({super.key});

  @override
  Widget build(BuildContext context) {
    String body = "";
    TextEditingController textController = TextEditingController();
    return Expanded(
        flex: 2,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: textController,
            decoration: InputDecoration(
              suffix: MaterialButton(
                  child: const Text("LOAD"),
                  onPressed: () {
                    url = Uri.https(textController.text);
                    webController.loadRequest(url);
                    context.read<TitleProvider>().setTitle(body, url);
                  }),
              border: const UnderlineInputBorder(),
              labelText: 'URL',
            ),
          ),
        ));
  }
}
