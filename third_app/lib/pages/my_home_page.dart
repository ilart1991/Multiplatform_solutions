import 'dart:convert';

import 'package:flutter/material.dart';

import '../domain/person.dart';
import '../domain/fetch_file.dart';
import '../widgets/less_720.dart';
import '../widgets/more_720.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: FutureBuilder(
        future: getData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (MediaQuery.of(context).size.width < 720) {
              return const Less720();
            } else {
              return const More720();
            }
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}

List users = [];

Future<List> getData =
    fetchFileFromAssets("assets/users.json").then((jsonData) {
  users = jsonDecode(jsonData)
      .map<Person>((user) => Person.fromJson(user))
      .toList();
  return users;
});
