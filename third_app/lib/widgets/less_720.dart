import 'package:flutter/material.dart';
import 'package:third_app/widgets/menu_list.dart';
import 'package:third_app/pages/my_home_page.dart';

class Less720 extends StatelessWidget {
  const Less720({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        return ListTile(
          onTap: () => showModalBottomSheet(
              context: context,
              builder: (context) {
                return MenuList();
              }),
          leading: CircleAvatar(
              backgroundImage:
                  AssetImage("assets/images/" + users[index].avatar)),
          title: Text(users[index].name),
          subtitle: Text(
            users[index].email,
          ),
        );
      },
    );
  }
}
