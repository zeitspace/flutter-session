import 'package:flutter/material.dart';

class AddTodoDialog extends StatelessWidget {
  final todoController = TextEditingController();

  @override
  Widget build(context) {
    return AlertDialog(
      title: Text("Add new todo"),
      content: TextField(
        autofocus: true,
        decoration: InputDecoration.collapsed(
          hintText: 'What do you need to do?',
          border: UnderlineInputBorder(),
        ),
        controller: todoController,
      ),
      actions: [
        FlatButton(
          child: Text("Cancel"),
          textColor: Theme.of(context).primaryColor,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        RaisedButton(
          child: Text("Add"),
          color: Theme.of(context).primaryColor,
          textColor: Colors.white,
          onPressed: () {
            Navigator.of(context).pop(todoController.text);
          },
        )
      ],
    );
  }
}
