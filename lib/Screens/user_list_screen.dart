import 'package:flutter/material.dart';

import '../Model/user.dart';

class UserLIstSCreen extends StatefulWidget {
  final List<User> users;
  final Function(User) onDelete;

  const UserLIstSCreen({Key? key, required this.users, required this.onDelete})
      : super(key: key);

  @override
  State<UserLIstSCreen> createState() => _UserLIstSCreenState();
}

class _UserLIstSCreenState extends State<UserLIstSCreen> {
  deleteUser(User user) {
    setState(() {
      widget.onDelete(user);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: const Text('Users'),
      ),
      body: Text('data'),
    );
  }
}
