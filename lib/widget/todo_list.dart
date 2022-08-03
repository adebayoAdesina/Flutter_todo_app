import 'package:flutter/material.dart';

class TodoList extends StatelessWidget {
  final String text;
  final bool isChecked;
  final ValueChanged onChange;
  final Function onLongPress;
  const TodoList({
    Key? key,
    required this.text,
    required this.isChecked,
    required this.onChange, required this.onLongPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: ()=>onLongPress(),
      title: Text(
        text,
        style: TextStyle(
          decoration: isChecked == true ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        activeColor: Theme.of(context).primaryColor,
        value: isChecked,
        onChanged: onChange,
      ),
    );
  }
}
