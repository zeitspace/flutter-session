import 'package:flutter/material.dart';
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
          primaryColor: Colors.indigo[600],
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
  const MyTodos({@required this.title});

  final String title;

  @override
  _MyTodosState createState() => _MyTodosState();
}

class _MyTodosState extends State<MyTodos> {
  List<Todo> _todos = [
    Todo("Do the dishes", false),
    Todo("Walk the dog", false),
    Todo("Water the plants", false),
    Todo("Buy groceries", false),
  ];

  List<Todo> _completeTodos = [
    Todo("Take out trash", true),
  ];

  bool showCompleted = true;

  toggleDone(newVal, index) {
    setState(() {
      if (newVal) {
        Todo item = _todos[index];
        item.isDone = true;
        _todos.removeAt(index);
        _completeTodos.add(item);
      } else {
        Todo item = _completeTodos[index];
        item.isDone = false;
        _completeTodos.removeAt(index);
        _todos.add(item);
      }
    });
  }

  _addTodo(context) {
    showDialog(context: context, builder: (_) => new AddTodoDialog())
        .then((val) => setState(() {
              if (val != null) _todos.add(Todo(val, false));
            }));
  }

  List<Widget> _todoList() {
    List<Widget> children = [];
    for (int i = 0; i < _todos.length; i++) {
      Todo item = _todos[i];
      children.add(TodoTile(
        name: item.name,
        isDone: item.isDone,
        index: i,
        toggle: toggleDone,
      ));
    }
    return children;
  }

  List<Widget> _completeList() {
    List<Widget> children = [];

    if (!showCompleted) return children;

    for (int i = 0; i < _completeTodos.length; i++) {
      Todo item = _completeTodos[i];
      children.add(TodoTile(
        name: item.name,
        isDone: item.isDone,
        index: i,
        toggle: toggleDone,
      ));
    }
    return children;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () => Navigator.pushNamed(context, "/friends"),
          ),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _addTodo(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16),
            Text("Todos", style: Theme.of(context).textTheme.headline4),
            SizedBox(height: 10),
            Column(children: _todoList()),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Completed", style: Theme.of(context).textTheme.headline4),
                Switch.adaptive(
                  value: showCompleted,
                  onChanged: (newVal) => setState(() => showCompleted = newVal),
                ),
              ],
            ),
            SizedBox(height: 10),
            Column(children: _completeList()),
          ],
        ),
      ),
    );
  }
}

class TodoTile extends StatelessWidget {
  TodoTile({
    @required this.name,
    @required this.isDone,
    @required this.index,
    @required this.toggle,
  });

  final String name;
  final bool isDone;
  final int index;
  final Function toggle;

  @override
  Widget build(context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          color: isDone ? Colors.grey[300] : Colors.white,
          border: Border.all(
            color: isDone ? Colors.grey[300] : Colors.grey[400],
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          )),
      child: Row(
        children: [
          Checkbox(
            activeColor: Theme.of(context).primaryColor,
            value: isDone,
            onChanged: (bool newVal) => toggle(newVal, index),
          ),
          Text(
            name,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
