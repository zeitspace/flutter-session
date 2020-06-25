import 'package:flutter/material.dart';

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

  List<Widget> _todoList() {
    List<Widget> children = [];
    for (int i = 0; i < _todos.length; i++) {
      String item = _todos[i];
      children.add(Text(item));
    }
    return children;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16),
            Text("Todos", style: Theme.of(context).textTheme.headline1),
            SizedBox(height: 10),
            Column(
              children: _todoList(),
              crossAxisAlignment: CrossAxisAlignment.start,
            ),
          ],
        ),
      ),
    );
  }
}
