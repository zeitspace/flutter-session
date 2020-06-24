import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Container(
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  Text('Todo App',
                      style: Theme.of(context)
                          .textTheme
                          .headline4
                          .copyWith(color: Colors.white)),
                  SizedBox(width: 20),
                  Icon(Icons.check, color: Colors.white, size: 36),
                ],
              ),
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
          ),
          ListTile(
              title: Text("My Todo's"),
              onTap: () {
                Navigator.pushNamed(context, '/');
              }),
          ListTile(
              title: Text("Friend's Todo's"),
              onTap: () {
                Navigator.pushNamed(context, '/friends');
              }),
        ],
      ),
    );
  }
}
