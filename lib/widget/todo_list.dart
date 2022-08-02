import 'package:flutter/material.dart';

class TodoList extends StatefulWidget {
  final String text;
  const TodoList({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.text),
      trailing: Checkbox(
          activeColor: Theme.of(context).primaryColor,
          value: isChecked,
          onChanged: (value) {
            setState(() {
              isChecked = value!;
            });
          }),
    );
  }
}
