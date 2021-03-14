import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_task/Model/todo_model.dart';
import 'package:todo_task/controller/database_helper.dart';
import 'package:provider/provider.dart';
import '../todo_details.dart';

class AllPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AllPageState();
  }
}

class AllPageState extends State<AllPage> {
  DatabaseHelper databaseHelper = DatabaseHelper();
  List<Todo> todoList;
  int count = 0;

  @override
  Widget build(BuildContext context) {
   // return Container(
      //Consumer<Todo>(
       // builder: (context, watch, child) {
          if (todoList == null) {
            todoList = List<Todo>();
            updateListView();
          }
          return Scaffold(
            body: getTodoListView(),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                navigateToDetail(Todo('', '', ''), 'Add Todo');
              },
              tooltip: 'Add Todo',
              child: Icon(Icons.add),
            ),
          );
        }
        //);}

  ListView getTodoListView() {
    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int position) {
        return Card(
          color: Colors.white,
          elevation: 2.0,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.amber,
              child: Text(getFirstLetter(this.todoList[position].title),
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            title: Text(this.todoList[position].title,
                style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text(this.todoList[position].description),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                GestureDetector(
                  child: Icon(Icons.delete,color: Colors.red,),
                  onTap: () {
                    _delete(context, todoList[position]);
                  },
                ),
              ],
            ),
            onTap: () {
              navigateToDetail(this.todoList[position], 'Edit Todo');
            },
          ),
        );
      },
    );
  }

  getFirstLetter(String title) {
    return title.substring(0, 2);
  }

  void _delete(BuildContext context, Todo todo) async {
    int result = await databaseHelper.deleteTodo(todo.id);
    if (result != 0) {
      _showSnackBar(context, 'Todo Deleted Successfully');
      updateListView();
    }
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    Scaffold.of(context).showSnackBar(snackBar);
  }

  void navigateToDetail(Todo todo, String title) async {
    bool result =
    await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return TodoDetail(todo, title);
    }));

    if (result == true) {
      updateListView();
    }
  }

  void updateListView() {
    final Future<Database> dbFuture = databaseHelper.initializeDatabase();
    dbFuture.then((database) {
      Future<List<Todo>> todoListFuture = databaseHelper.getTodoList();
      todoListFuture.then((todoList) {
        setState(() {
          this.todoList = todoList;
          this.count = todoList.length;
        });
      });
    });
  }
}