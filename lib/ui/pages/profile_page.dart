import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
class ProfilePage extends StatelessWidget{

  final FirebaseUser user;

  ProfilePage(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('user profile'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(title: Text('User id: ${user.uid}')),
          ListTile(title: Text('Display name: ${user.displayName}')),
          ListTile(title: Text('Anonymous: ${user.isAnonymous}')),
          ListTile(title: Text('providerId: ${user.providerId}')),
          ListTile(title: Text('Email: ${user.email}')),
          ListTile(
            title: Text('Profile photo: '),
            trailing: user.photoUrl != null
                ? CircleAvatar(
              backgroundImage: NetworkImage(user.photoUrl),
            )
                : CircleAvatar(
              child: Text(user.displayName[0]),
            ),
          ),
          ListTile(
            title: Text(
                'Last sign in: ${DateTime.fromMillisecondsSinceEpoch(
                    user.metadata.lastSignInTimestamp)}'),
          ),
          ListTile(
            title: Text(
                'Creation time: ${DateTime.fromMillisecondsSinceEpoch(
                    user.metadata.creationTimestamp)}'),
          ),
          ListTile(title: Text('ProviderData: ${user.providerData}')),
        ],
      ),
    );
  }
}