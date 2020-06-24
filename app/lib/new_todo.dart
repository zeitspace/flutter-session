import 'package:flutter/material.dart';

class AddTodoDialog extends StatelessWidget {
  final todoController = TextEditingController();

  @override
  Widget build(context) {
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            child: Text(
              "Add a new Todo",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            color: Theme.of(context).primaryColor,
            width: double.infinity,
            padding: EdgeInsets.all(18),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  decoration: InputDecoration.collapsed(
                    hintText: 'What do you need to do?',
                    border: UnderlineInputBorder(),
                  ),
                  controller: todoController,
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FlatButton(
                      child: Text("Cancel"),
                      textColor: Theme.of(context).primaryColor,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    SizedBox(width: 8),
                    RaisedButton(
                      child: Text("Add"),
                      color: Theme.of(context).primaryColor,
                      textColor: Colors.white,
                      onPressed: () {
                        Navigator.of(context).pop(todoController.text);
                      },
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
