

import 'package:doom_covid/screens/UnderConstruction.dart';
import 'package:doom_covid/screens/initial_screen.dart';
import 'package:flutter/material.dart';

class DrawerSidePane extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text('Aman Mulani'),
            accountEmail: Text('amanmulani369@gmail,.com'),
            currentAccountPicture: GestureDetector(
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.person, color: Colors.grey, size: 54.0,),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.pink,
            ),
          ),
          DrawerSubOptions(
            title: 'Home',
            icon: Icons.home,
            onTap: (){
              Navigator.pop(context);
            },
          ),
          DrawerSubOptions(title: 'My Account',
            icon: Icons.person,
            onTap: (){
              Navigator.pushNamed(context, UnderConstruction.screenName);
            },
          ),
          DrawerSubOptions(
            title: 'Location Track',
            icon: Icons.local_activity,
            onTap: (){
              Navigator.pushNamed(context, UnderConstruction.screenName);
            },
          ),
          DrawerSubOptions(
            title: 'WHO Updates',
            icon: Icons.healing,
            onTap: (){
            Navigator.pushNamed(context, UnderConstruction.screenName);
            },
          ),
          DrawerSubOptions(
            title: 'News Feed',
            icon: Icons.update,
            onTap: (){
            Navigator.pushNamed(context, UnderConstruction.screenName);
            },
          ),
          Divider(),
          DrawerSubOptions(
            title: 'Settings',
            icon: Icons.settings,
            onTap: (){
            Navigator.pushNamed(context, UnderConstruction.screenName);
            },
          ),
          DrawerSubOptions(title: 'About',
            icon: Icons.help,
            onTap: (){
            Navigator.pushNamed(context, UnderConstruction.screenName);
            },
          ),
        ],
      ),
    );
  }
}

class DrawerSubOptions extends StatelessWidget {

  final String title;
  final IconData icon;
  final Function onTap;
  DrawerSubOptions({this.title, this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ListTile(
        title: Text(title),
        leading: Icon(icon, color: Colors.redAccent,),
      ),
    );
  }
}

