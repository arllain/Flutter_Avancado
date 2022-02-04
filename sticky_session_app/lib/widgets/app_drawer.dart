import 'package:flutter/material.dart';
import 'package:sticky_session_app/constants.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DrawerHeader(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Image(
                  image: AssetImage("assets/profile.png"),
                  width: 80,
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  "Arllain Silva",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                SizedBox(
                  height: 6,
                ),
                Text("arllain@gmail.com")
              ],
            ),
          ),
          ListTile(
            title: Row(
              children: const [
                Icon(
                  Icons.coffee,
                  color: kRedColor,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  'Meetings',
                  style:
                      TextStyle(fontWeight: FontWeight.bold, color: kRedColor),
                )
              ],
            ),
            onTap: () {
              Navigator.pushNamed(context, '/sessions');
            },
          ),
          ListTile(
            title: Row(
              children: const [
                Icon(
                  Icons.info,
                  color: Colors.grey,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  'About',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.grey),
                )
              ],
            ),
            onTap: () {},
          ),
          ListTile(
            title: Row(
              children: const [
                Icon(Icons.settings, color: Colors.grey),
                SizedBox(
                  width: 8,
                ),
                Text(
                  'Settings',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.grey),
                )
              ],
            ),
            onTap: () {},
          ),
          const Spacer(),
          ListTile(
            title: Row(
              children: const [
                Icon(Icons.logout, color: kRedColor),
                SizedBox(
                  width: 8,
                ),
                Text(
                  'Logout',
                  style:
                      TextStyle(fontWeight: FontWeight.bold, color: kRedColor),
                )
              ],
            ),
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, loginRouter, (route) => false);
            },
          ),
          const ListTile(
            title: Text("v 0.0.1"),
          ),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
