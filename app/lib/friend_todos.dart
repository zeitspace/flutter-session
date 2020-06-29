import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Todo {
  String name;
  bool isDone;

  Todo(this.name, this.isDone);

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(json['name'], json['isDone']);
  }
}

class Friend {
  String name;
  List<Todo> todos;

  Friend({@required this.name, this.todos});

  factory Friend.fromJson(Map<String, dynamic> json) {
    List<Todo> todos = [];

    for (int i = 0; i < json['todos'].length; i++) {
      todos.add(
        Todo.fromJson(json['todos'][i]),
      );
    }

    return Friend(
      name: json['name'],
      todos: todos,
    );
  }
}

class FriendTodos extends StatefulWidget {
  FriendTodos({@required this.title});
  final String title;

  @override
  _FriendTodosState createState() => _FriendTodosState();
}

class _FriendTodosState extends State<FriendTodos> {
  Future<dynamic> _getFriendData() async {
    var res = await http.get(
      "https://s3.amazonaws.com/zeitspace.com/media/2020/06/friend-todos.json",
    );

    List<dynamic> resJson = jsonDecode(res.body);

    List<Friend> friends = [];

    for (int i = 0; i < resJson.length; i++) {
      friends.add(Friend.fromJson(resJson[i]));
    }

    return friends;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder(
        future: _getFriendData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var friends = snapshot.data;
            return ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 16),
              itemBuilder: (context, index) {
                return FriendWidget(friends[index]);
              },
              separatorBuilder: (context, index) =>
                  Divider(color: Colors.grey[700]),
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
  FriendWidget(this.friend);

  final friend;

  List<Widget> _todoList() {
    List<Widget> children = [];

    for (int i = 0; i < friend.todos.length; i++) {
      var todo = friend.todos[i];
      children.add(Row(
        children: [
          Icon(Icons.lens, size: 6),
          SizedBox(width: 6),
          Text(
            todo.name,
            style: TextStyle(
              decoration: todo.isDone
                  ? TextDecoration.lineThrough
                  : TextDecoration.none,
            ),
          ),
        ],
      ));
    }
    return children;
  }

  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(friend.name, style: Theme.of(context).textTheme.headline2),
          Column(children: _todoList()),
        ],
      ),
    );
  }
}
