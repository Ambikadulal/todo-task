import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_task/Model/todo_model.dart';
import 'package:todo_task/screens/bottom_navigation/contacts.dart';
import 'package:todo_task/screens/tab_bar/all_todo.dart';
import 'package:todo_task/screens/tab_bar/today_todo.dart';
import 'package:todo_task/screens/tab_bar/tomorrow.dart';
import 'package:todo_task/screens/todoui.dart';
import 'controller/database_helper.dart';

void main() => runApp(MyApp());
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return
      //ChangeNotifierProvider(
     // builder: (context)=>Todo(),
       MaterialApp(
        title: "TODO",
        initialRoute: 'TodoUi',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light().copyWith(
          accentColor: Colors.black54,
        ),
        home: TodoUi(),
        routes: {
          'AllPage': (context) => AllPage(),
          'TodayPage': (context) => TodayPage(),
          'TomorrowPage': (context) => TomorrowPage(),
          'ContactsPage': (context) => ContactsPage(),
        }
      //),
    );
  }
}