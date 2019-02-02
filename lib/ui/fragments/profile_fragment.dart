import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zoo_app/resources/app_strings.dart';
import 'package:zoo_app/services/auth_service.dart';


class ProfileFragment extends StatefulWidget {
  @override
  ProfileFragmentState createState() => ProfileFragmentState();
}

class ProfileFragmentState extends State<ProfileFragment> {
  FirebaseUser user;

  @override
  void initState() {
    super.initState();
    AuthService.currentUser
        .then(
          (user) =>
          setState(() {
            this.user = user;
          }),
    );
  }

  bool _isUserLoggedIn() {
    return user != null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          Padding(padding: EdgeInsets.only(top: 15.0),
              child: CircleAvatar(maxRadius: 40.0,
                backgroundColor: Colors.green,
                child: Icon(Icons.person, size: 50.0, color: Colors.white,),)),
          _buildUserLoggedStatusLabel(),
          _buildUserLoggedRowButtons(),
          Divider(),
          GestureDetector(child: _buildProfileMenuNavigation(
              Strings.profileNavSettingTitle,
              Strings.profileNavSettingTitle,
              Icons.settings),
              onTap: (){
                
              },),
          Divider(),
         GestureDetector(child: _buildProfileMenuNavigation(
              Strings.profileNavAboutAppTitle,
              Strings.profileNavAboutAppSubtitle,
              Icons.info_outline),
              onTap: (){

              },),
          Divider(),
          GestureDetector(child:_buildProfileMenuNavigation(
              Strings.profileNavTocAppTitle,
              Strings.profileNavTocAppSubtitle,
              Icons.copyright),
              onTap: (){

              },) 
        ],
      ),
    );
  }

  MaterialButton _buildGoogleSignInButton() {
    return MaterialButton(
      color: Colors.redAccent,
      child: Text(Strings.profileLoginWithGoogle, style: TextStyle(
          color: Colors.white,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
          fontSize: 10.0),),
      onPressed: () {
        AuthService.authWithGoogle()
          ..then((user) =>
              setState(() {
                this.user = user;
              }),
          )
          ..catchError((e) => print(e));
      },
    );
  }

  MaterialButton _buildFBSignInButton() {
    return MaterialButton(
      color: Colors.blue,
      child: Text(Strings.profileLoginWithFB, style: TextStyle(
          color: Colors.white,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
          fontSize: 10.0),),
      onPressed: () {
        AuthService.authAnonymousLy
          ..then((user) =>
              setState(() {
                this.user = user;
              }),
          )
          ..catchError((e) => print(e));
      },
    );
  }

  Widget _buildEditProfileButton() {
    return OutlineButton(
      child: Text(Strings.profileEditProfile, style: TextStyle(
          color: Colors.green,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
          fontSize: 11.0)),
      onPressed: () {},
      borderSide: BorderSide(color: Colors.green),
      splashColor: Colors.green,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(3.0)),
    );
  }

  Widget _buildLogoutButton() {
    return OutlineButton(
      child: Text(Strings.profileLogout, style: TextStyle(
          color: Colors.green,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
          fontSize: 11.0)),
      onPressed: () {
        AuthService.authLogOut
          ..then((user) =>
              setState(() {
                this.user = user;
              }),
          )
          ..catchError((e) => print(e));
      },
      borderSide: BorderSide(color: Colors.green),
      splashColor: Colors.green,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(3.0)),
    );
  }

  Widget _buildRow(Widget child) {
    return Expanded(
      flex: 1,
      child: Padding(child: child, padding: EdgeInsets.all(5.0)),
    );
  }

  Widget _buildUserLoggedRowButtons() {
    return Padding(
        padding: EdgeInsets.only(left: 10.0, right: 10.0),
        child: Row(
        children:
        <Widget>[
          _buildRow(_isUserLoggedIn()
              ? _buildEditProfileButton()
              : _buildGoogleSignInButton()),
          _buildRow(_isUserLoggedIn()
              ? _buildLogoutButton()
              : _buildFBSignInButton()),
        ]));
  }

  Widget _buildUserLoggedStatusLabel() {
    return Center(child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.0),
        child: Text(
            _isUserLoggedIn() ? "Halo, ${user
                .displayName}" :  Strings.profileNotYetLogin, style: TextStyle(
            color: Colors.green,
            fontFamily: 'Poppins',
            fontWeight: user == null ? FontWeight.w400 : FontWeight.w600,
            fontSize: user == null ? 12.0 : 16.0))
    ));
  }

  Widget _buildProfileMenuNavigation(String title, String subtitle,
      IconData icon) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title, style: TextStyle(
          color: Colors.black54,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
          fontSize: 14.0),),
      subtitle: Text(subtitle, style: TextStyle(
          color: Colors.black54,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
          fontSize: 12.0)),
    );
  }

  

/*  */
}
