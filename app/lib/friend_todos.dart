import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart';
import './my_drawer.dart';

class FriendTodos extends StatefulWidget {
  FriendTodos({@required this.title});
  final String title;

  @override
  _FriendTodosState createState() => _FriendTodosState();
}

class _FriendTodosState extends State<FriendTodos> {
  Future<dynamic> _getFriendData() async {
    var response = await get(
      "https://s3.amazonaws.com/zeitspace.com/media/2020/06/friend-todos.json",
    );

    var friends = jsonDecode(response.body);

    return friends;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: MyDrawer(),
      body: FutureBuilder(
        future: _getFriendData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var friends = snapshot.data;
            return ListView.separated(
              itemBuilder: (context, index) {
                return FriendWidget(friend: friends[index]);
              },
              separatorBuilder: (context, index) => Divider(),
              itemCount: friends.length,
            );
          } else if (snapshot.hasError) {
            return Center(child: Text("An Error occured"));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

class FriendWidget extends StatelessWidget {
  FriendWidget({@required this.friend});

  final friend;

  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(friend['name'], style: Theme.of(context).textTheme.headline6),
          ListView.builder(
            shrinkWrap: true,
            itemCount: friend['todos'].length,
            itemBuilder: (context, index) {
              var todo = friend['todos'][index];
              return Row(
                children: [
                  Icon(Icons.fiber_manual_record, size: 6),
                  SizedBox(width: 6),
                  Text(
                    todo['name'],
                    style: TextStyle(
                      decoration: todo["isDone"]
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                ],
              );
            },
          )
        ],
      ),
    );
  }
}
