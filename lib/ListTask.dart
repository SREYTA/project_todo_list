
import 'package:flutter/material.dart';
import 'Todo.dart';

  class ListTask extends StatefulWidget {
  @override
  _ListTaskState createState() => _ListTaskState();
}

  class _ListTaskState extends State<ListTask> {
  List<Todo> todos = [];
  TextEditingController controller = new TextEditingController();

  _toggleTodo(Todo todo, bool isChecked) {
    setState(() {
     todo.isDone = isChecked; 
    });
  }

  Widget _buildItem(BuildContext context, int index){
    final todo = todos[index];

    return CheckboxListTile(
      value: todo.isDone,
      title: Text(todo.title),
      onChanged: (bool isChecked){
        _toggleTodo(todo, isChecked);
      }

    );
  }

  // add todo list that use async await
  _addTodo(){
    showDialog<Todo>(
      context: context,
      builder:  (BuildContext context){
        return AlertDialog(
          
          title: Text('New todo'),
            content: TextField(controller: controller, autofocus: true,),
           actions: <Widget>[
            FlatButton(
              child: Text('Cancel'),
              onPressed: (){
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text('Add'),
              onPressed: (){
                setState(() {
                  final todo = new Todo(title: controller.value.text,);
                  if(controller.value.text == ""){
                    print("");
                  }else {
                    todos.add(todo);
                  }
                  controller.clear();
                
                  Navigator.of(context).pop();
                });
              },
            ),
           ],
        );
      } 
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Todo List')),
        body: ListView.builder(
          itemBuilder: _buildItem,
          itemCount: todos.length,
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: _addTodo,
        ),
    );
  }
}