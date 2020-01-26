
import 'package:flutter/material.dart';
import 'Todo.dart';

  class ListTask extends StatefulWidget {
  @override
  _ListTaskState createState() => _ListTaskState();
}

  class _ListTaskState extends State<ListTask> {
    // create array list todos
  List<Todo> todos = [];

    // create object controller form TextEditingController 
      //Note: we used TextEditingController to provide an initial value for a text field 
  TextEditingController controller = new TextEditingController();

  // create function _toggleTodo that have perimater todo and isChecked
    //it will isChecked if todo isDone
  _toggleTodo(Todo todo, bool isChecked) {
    setState(() {
     todo.isDone = isChecked; 
    });
  }

  // create function _buildItem that have perimeter context and index
    // declare variable todo and it will return CheckboxListTile that have value, title, onChange
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

  // create _addTodo to show dialog
  _addTodo(){
    showDialog<Todo>(
      context: context,
      builder:  (BuildContext context){
        return AlertDialog(
          
          title: Text('New todo'),
            content: TextField(controller: controller, autofocus: true,),
           actions: <Widget>[
             
            // create button cancel in the alert dialog 
            FlatButton(
              child: Text('Cancel'),
              onPressed: (){
                Navigator.of(context).pop();
                controller.clear();
              },
            ),

            // create button add in the alert dialog
              // if textField emplty it will don't show checkbox and even if textField not emplty it will show checkbox
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