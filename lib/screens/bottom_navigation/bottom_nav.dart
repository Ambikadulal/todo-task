import 'package:flutter/material.dart';
import 'package:todo_task/screens/bottom_navigation/contacts.dart';

class BottomBar extends StatefulWidget {
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNav(),
    );
  }
}
class BottomNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: kToolbarHeight,
      decoration: BoxDecoration(color: Colors.grey),
      child: Row(
        children: <Widget>[
          Expanded(
            child: InkWell(
              onTap: () {
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Todos',style: TextStyle(fontSize: 20),),
              )
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ContactsPage(),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Contacts',style: TextStyle(fontSize: 20),),
              )
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () {
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Calls',style: TextStyle(fontSize: 20),),
              )
            ),
          ),
        ],
      ),
    );
  }
}
