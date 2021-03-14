import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class sidedrawer extends StatefulWidget {
  const sidedrawer({Key key}) : super(key: key);

  @override
  _sidedrawerState createState() => _sidedrawerState();
}

class _sidedrawerState extends State<sidedrawer> {
  int selected=0;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Drawer(
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                      image: NetworkImage(
                        "https://cnet1.cbsistatic.com/img/NmTo06FvEM6ZR9ld7a3_wlBKz7Y=/1200x675/2019/02/04/8311b046-6f2b-4b98-8036-e765f572efad/msft-microsoft-logo-2-3.jpg",
                      )),
                ),
              ),
              Container(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      ListView.builder(
                          key:
                          Key('builder ${selected.toString()}'), //attention

                          padding: EdgeInsets.only(
                              left: 13.0, right: 13.0, bottom: 25.0),
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: 1,
                          itemBuilder: (context, index) {
                            return Column(
                              children: <Widget>[
                                Divider(
                                  height: 15.0,
                                  color: Colors.white,
                                ),
                                // SizedBox(height: 20.0),
                                ExpansionTile(
                                  key: Key(index.toString()), //attention
                                  initiallyExpanded: index == selected, //attention
                                  title: Text(
                                    "Top Category",
                                    style: TextStyle(
                                        fontSize: 18.0,color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  children: <Widget>[
                                    ListTile(
                                      title: Text('All Todos '),
                                      leading: Icon(
                                        Icons.directions_walk,
                                        color: Colors.black,
                                      ),
                                      trailing: Icon(Icons.arrow_right),
                                      onTap: () => Navigator.pushNamed(
                                        context,
                                        'AllPage',
                                      ),
                                    ),
                                    ListTile(
                                      title: Text('Today '),
                                      leading: Icon(
                                        Icons.speaker_group,
                                        color: Colors.black,
                                      ),
                                      trailing: Icon(Icons.arrow_right),
                                      onTap: () => Navigator.pushNamed(
                                        context,
                                        'TodayPage',
                                      ),
                                    ),
                                    ListTile(
                                      title: Text('Tomorrow'),
                                      leading: Icon(
                                        Icons.attach_money,
                                        color: Colors.black,
                                      ),
                                      trailing: Icon(Icons.arrow_right),
                                      onTap: () => Navigator.pushNamed(
                                        context,
                                        'TomorrowPage',
                                      ),
                                    ),
                                    ListTile(
                                      title: Text('Contacts'),
                                      leading: Icon(
                                        Icons.attach_money,
                                        color: Colors.black,
                                      ),
                                      trailing: Icon(Icons.arrow_right),
                                      onTap: () => Navigator.pushNamed(
                                        context,
                                        'ContactsPage',
                                      ),
                                    ),
                                  ],
                                  onExpansionChanged: ((newState) {
                                    if (newState)
                                      setState(() {
                                        Duration(seconds: 20000);
                                        selected = index;
                                      });
                                    else
                                      setState(() {
                                        selected = -1;
                                      });
                                  }),
                                ),
                                //SizedBox(height: 20,),
                                  ],
                            );
                          }),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
