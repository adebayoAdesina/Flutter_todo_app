import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/appdata.dart';

class TopSection extends StatelessWidget {
  const TopSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 60.0,
        left: 30.0,
        bottom: 30.0,
        right: 30.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 30.0,
            backgroundColor: Colors.white,
            child: Icon(
              Icons.list,
              size: 40.0,
              color: Theme.of(context).primaryColor,
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          const Text(
            'Todo',
            style: TextStyle(
                color: Colors.white,
                fontSize: 50.0,
                fontWeight: FontWeight.w700),
          ),
          Text(
            '${context.watch<AppData>().tasks.length}Task',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18.0,
            ),
          ),
        ],
      ),
    );
  }
}
