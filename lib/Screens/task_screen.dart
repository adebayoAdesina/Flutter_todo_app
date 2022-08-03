import 'package:flutter/material.dart';
import 'package:flutter_todo_with_provider/Provider/appdata.dart';
import 'package:flutter_todo_with_provider/widget/todo_list.dart';
import 'package:provider/provider.dart';

import '../widget/top_section.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({Key? key}) : super(key: key);

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  String? textEditingController;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: ((context) => AppData()),
      builder: (((context, child) => Scaffold(
            backgroundColor: Theme.of(context).primaryColor,
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TopSection(),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(
                      left: 30.0,
                      right: 30.0,
                    ),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                      color: Colors.white,
                    ),
                    child: ListView.builder(
                      itemCount: context.watch<AppData>().tasks.length,
                      itemBuilder: (context, index) {
                        final task = context.watch<AppData>().tasks[index];
                        return TodoList(
                          text: task.text.toString(),
                          isChecked: task.isChecked,
                          onChange: (value) {
                            context.read<AppData>().toggle(task);
                          },
                          onLongPress: (){
                            context.read<AppData>().deleteTodo(task);
                          },
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                showModel(context, context.read<AppData>());
              },
              child: const Icon(Icons.add),
              backgroundColor: Theme.of(context).primaryColor,
            ),
          ))),
    );
  }

  Future<dynamic> showModel(BuildContext context, contexts) {
    return showModalBottomSheet(
      // isScrollControlled: true,
      context: context,
      builder: (context) => FractionallySizedBox(
        // heightFactor: 0.7,
        child: Container(
          color: const Color(0XFF757575),
          child: Container(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 80.0),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Add Todo',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 30.0,
                      fontWeight: FontWeight.w700),
                ),
                TextField(
                  autofocus: true,
                  onChanged: (value) {
                    textEditingController = value;
                  },
                ),
                TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor),
                  onPressed: () {
                    contexts.addTask(textEditingController);

                    Navigator.pop(context);
                  },
                  child: const SizedBox(
                    width: double.infinity,
                    child: Text('Add',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
