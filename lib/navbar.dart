 import 'package:flutter/material.dart';

 class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
          accountName: Text('aadhil muhammed'),
          accountEmail: Text('aadhil5@gmail.com'),
          currentAccountPicture: CircleAvatar(
            child: ClipOval(
              child: Image.network(
                'https://d2v9ipibika81v.cloudfront.net/uploads/sites/210/Profile-Icon.png',
                width: 90,
                height: 90,
                fit: BoxFit.cover,
                ),
                
            ),
          ),
          )
        ],
      ),
    );
  }
}