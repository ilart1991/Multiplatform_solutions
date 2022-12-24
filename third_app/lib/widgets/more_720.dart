import 'package:flutter/material.dart';
import 'package:popover/popover.dart';
import 'package:third_app/pages/my_home_page.dart';
import 'menu_list.dart';

class More720 extends StatelessWidget {
  const More720({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Column(
          children: const [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "MAIN MENU",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(title: Text("Пункт меню")),
            ListTile(title: Text("Пункт меню")),
            ListTile(title: Text("Пункт меню")),
            ListTile(title: Text("Пункт меню")),
            ListTile(title: Text("Пункт меню")),
            ListTile(title: Text("Пункт меню")),
            ListTile(title: Text("Пункт меню")),
            ListTile(title: Text("Пункт меню")),
          ],
        )),
        Expanded(
          flex: 4,
          child: GridView.builder(
              itemCount: users.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3),
              itemBuilder: ((context1, index) {
                return GridTile(
                  header: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            showPopover(
                                context: context,
                                bodyBuilder: (context) => const SizedBox(
                                    height: 170, width: 400, child: MenuList()),
                                arrowDxOffset: 25,
                                arrowDyOffset: 300);
                          },
                          child: CircleAvatar(
                              radius: 60,
                              backgroundImage: AssetImage(
                                  "assets/images/" + users[index].avatar)),
                        ),
                      ),
                      Text(
                        users[index].name,
                        style: const TextStyle(fontSize: 16),
                      ),
                      Text(
                        users[index].email,
                        style: const TextStyle(color: Colors.grey),
                      )
                    ],
                  ),
                  child: Container(),
                );
              })),
        ),
      ],
    );
  }
}
