import 'package:flutter/material.dart';

class NavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.grey[400], width: 1),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () => Navigator.pushReplacementNamed(context, '/'),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [Icon(Icons.check), Text("My List")],
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.pushReplacementNamed(context, '/friends'),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [Icon(Icons.person), Text("Friends")],
            ),
          )
        ],
      ),
    );
  }
}
