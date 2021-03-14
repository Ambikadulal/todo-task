import 'package:flutter/material.dart';
import 'package:todo_task/screens/bottom_navigation/bottom_nav.dart';
import 'package:todo_task/screens/sidedrawer.dart';
import 'package:todo_task/screens/tab_bar/all_todo.dart';
import 'package:todo_task/screens/tab_bar/today_todo.dart';
import 'package:todo_task/screens/tab_bar/tomorrow.dart';

class TodoUi extends StatefulWidget {
  @override
  _TodoUiState createState() => _TodoUiState();
}

class _TodoUiState extends State<TodoUi> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: BottomNav(),
        appBar: AppBar(
          backgroundColor: Colors.white54,
          title: Center(child: Text('Your todos',
            style: TextStyle(fontSize: 25, color: Colors.black),)),
          bottom: TabBar(
            indicatorColor: Colors.black,
            isScrollable: true,
            tabs: <Widget>[
              Tab(
                child: Text(
                  'All', style: TextStyle(fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
                ),
              ),
              Tab(
                child:
                Text('Today', style: TextStyle(fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),),
              ),
              Tab(
                child:
                Text('Tomorrow', style: TextStyle(fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),),
              ),
            ],
          ),
        ),
        drawer: sidedrawer(),
        body: Container(
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: TabBarView(
              physics: AlwaysScrollableScrollPhysics(),
              children: [
                TodayPage(),
                AllPage(),
                TomorrowPage(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

