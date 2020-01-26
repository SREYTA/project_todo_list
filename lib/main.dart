
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project/ListTask.dart';

void main(){
  SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(TodoList());
}
class TodoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ListTask(),
    );
  }
}