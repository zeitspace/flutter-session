import 'package:flutter/material.dart';
import './my_drawer.dart';
import './new_todo.dart';
import './friend_todos.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'What Todo',
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          primaryColor: Colors.green[900],
        ),
        home: MyTodos(title: 'My Todo List'),
        routes: {
          '/friends': (context) => FriendTodos(title: "Friends Todos"),
        });
  }
}

class Todo {
  Todo(this.name, this.isDone);

  String name;
  bool isDone;
}

class MyTodos extends StatefulWidget {
  const MyTodos({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyTodosState createState() => _MyTodosState();
}

class _MyTodosState extends State<MyTodos> {
  List<Todo> _todos = [
    Todo("Get groceries", true),
    Todo("Learn about Flutter", false),
  ];

  _toggleDone(newVal, index) {
    setState(() {
      _todos[index].isDone = newVal;
    });
  }

  _addTodo(context) {
    showDialog(context: context, builder: (_) => new AddTodoDialog())
        .then((val) => {
              setState(() {
                _todos.add(Todo(val, false));
              })
            });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: MyDrawer(),
      body: ListView.builder(
          itemCount: _todos.length,
          itemBuilder: (BuildContext context, int index) {
            Todo item = _todos[index];

            return ListTile(
              title: Text(
                item.name,
                style: TextStyle(
                  fontSize: 16,
                  decoration: item.isDone
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),
              trailing: Checkbox(
                  value: item.isDone,
                  onChanged: (bool newVal) => _toggleDone(newVal, index)),
            );
          }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () => _addTodo(context),
      ),
    );
  }
}
