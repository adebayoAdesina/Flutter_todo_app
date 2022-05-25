import 'package:flutter/material.dart';
import 'package:flutter_todo_with_provider/Screens/user_list_screen.dart';
import 'package:flutter_todo_with_provider/widget/cheatah_input.dart';
import 'package:flutter_todo_with_provider/widget/cheetah_button.dart';
import 'package:flutter_todo_with_provider/widget/user_list.dart';

import '../Model/user.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? _name;
  String? _city;

  List<User> userList = [];

  void addUser(User user) {
    setState(() {
      userList.add(user);
    });
  }

  void deleteUser(User user) {
    setState(() {
      userList.removeWhere((element) => element.name == user.name);
    });
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text(
          'Provider Demo',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CheetahInput(
                  labelText: 'Name',
                  onSaved: (String value) {
                    _name = value;
                  }),
              const SizedBox(
                height: 16,
              ),
              CheetahInput(
                  labelText: 'todos',
                  onSaved: (String value) {
                    _name = value;
                  }),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  CheetahButton(
                      text: 'Add',
                      onPressed: () {
                        if (!_formKey.currentState!.validate()) {
                          return _formKey.currentState!.save();
                        }
                        addUser(User(_name!, _city!));
                      }),
                  const SizedBox(
                    width: 8,
                  ),
                  CheetahButton(
                      text: 'List',
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => UserLIstSCreen(
                                    users: userList, onDelete: deleteUser)));
                      }),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              UserList(userList, deleteUser)
            ],
          )),
    );
  }
}
