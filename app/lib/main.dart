import 'package:flutter/material.dart';
import './new_todo.dart';

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
        textTheme: TextTheme(
          headline1: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.grey[800],
          ),
          headline2: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ),
      home: MyTodos(title: 'My Todo List'),
    );
  }
}

class MyTodos extends StatefulWidget {
  const MyTodos({@required this.title});

  final String title;

  @override
  _MyTodosState createState() => _MyTodosState();
}

class _MyTodosState extends State<MyTodos> {
  List<String> _todos = [
    "Do the dishes",
    "Walk the dog",
    "Water the plants",
    "Buy groceries",
  ];

  List<String> _completeTodos = [
    "Take out trash",
  ];

  void toggleDone(bool newVal, int index) {
    if (newVal) {
      String item = _todos[index];
      _todos.removeAt(index);
      setState(() => _completeTodos.add(item));
    } else {
      String item = _completeTodos[index];
      _completeTodos.removeAt(index);
      setState(() => _todos.add(item));
    }
  }

  void _addTodo(BuildContext context) async {
    String newTodo = await showDialog(
      context: context,
      builder: (context) => new AddTodoDialog(),
    );

    if (newTodo != null) setState(() => _todos.add(newTodo));
  }

  List<Widget> _todoList() {
    List<Widget> children = [];
    for (int i = 0; i < _todos.length; i++) {
      String item = _todos[i];
      children.add(TodoTile(
        name: item,
        isDone: false,
        index: i,
        toggle: toggleDone,
      ));
    }
    return children;
  }

  List<Widget> _completeList() {
    List<Widget> children = [];

    for (int i = 0; i < _completeTodos.length; i++) {
      String item = _completeTodos[i];
      children.add(TodoTile(
        name: item,
        isDone: true,
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
            Text("Todos", style: Theme.of(context).textTheme.headline1),
            SizedBox(height: 10),
            Column(children: _todoList()),
            SizedBox(height: 10),
            Text("Completed", style: Theme.of(context).textTheme.headline1),
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
  Widget build(BuildContext context) {
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
