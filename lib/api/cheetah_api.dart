import 'dart:async';
import 'package:intl/intl.dart';

Future<String> getProfileUserName() async {
  await Future.delayed(const Duration(seconds: 5));

  return "Julian Currie";
}

Future<String> getCurrentTime() async {
  await Future.delayed(const Duration(seconds: 5));

  return DateFormat("hh:mm aa").format(DateTime.now());
}

Stream<int> getSessionTime() {
  return Stream.periodic(const Duration(seconds: 1), (sessionTime) => sessionTime++);
}