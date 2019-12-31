import 'package:flutter/material.dart';
class ProfilePage extends StatelessWidget{


  ProfilePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('user profile'),
      ),
      body: ListView(
        children: <Widget>[
//          ListTile(title: Text('User id: ${user.uid}')),
//          ListTile(title: Text('Display name: ${user.displayName}')),
//          ListTile(title: Text('Anonymous: ${user.isAnonymous}')),
//          ListTile(title: Text('providerId: ${user.providerId}')),
//          ListTile(title: Text('Email: ${user.email}')),
          ListTile(
            title: Text('Profile photo: '),
            trailing: CircleAvatar(
              backgroundImage: NetworkImage('http://ideastic.net/img/ideastic-logo.png'),
            ),
          ),
          ListTile(
            title: Text(
                'Last sign in: ${DateTime.fromMillisecondsSinceEpoch(
                    0)}'),
          ),
          ListTile(
            title: Text(
                'Creation time: ${DateTime.fromMillisecondsSinceEpoch(
                    0)}'),
          ),
          ListTile(title: Text('ProviderData: ')),
        ],
      ),
    );
  }
}