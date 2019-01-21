import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:async';

class AuthService {

  static FirebaseUser kUser;
  static FirebaseAnalytics kFirebaseAnalytics = FirebaseAnalytics();
  static FirebaseAuth kFirebaseAuth = FirebaseAuth.instance;
  static GoogleSignIn kGoogleSignIn = GoogleSignIn();
  static final authWithGoogle = _googleSignIn;
  static final authAnonymousLy = _anonymousSignIn();
  static final authLogOut = _signOut();
  static final currentUser = _getCurrentUser();

  static AuthService _instance;
  factory AuthService() => _instance ??= AuthService();

  // Sign in with Google.
  static Future<FirebaseUser> _googleSignIn() async {
    final curUser = AuthService.kUser ?? await kFirebaseAuth.currentUser();
    if (curUser != null && !curUser.isAnonymous) {
      return curUser;
    }
    final googleUser = await kGoogleSignIn.signIn();
    final googleAuth = await googleUser.authentication;
    // Note: user.providerData[0].photoUrl == googleUser.photoUrl.
    final user = await kFirebaseAuth.signInWithGoogle(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    kFirebaseAnalytics.logLogin();
    return user;
  }

  // Sign in Anonymously.
  static Future<FirebaseUser> _anonymousSignIn() async {
    final currentUser = AuthService.kUser ?? await kFirebaseAuth.currentUser();
    if (currentUser != null && currentUser.isAnonymous) {
      return currentUser;
    }
    kFirebaseAuth.signOut();
    final anonymousUser = await kFirebaseAuth.signInAnonymously(); // final
    final userInfo = UserUpdateInfo();
    userInfo.displayName = '${anonymousUser.uid.substring(0, 5)}_Guest';
    await anonymousUser.updateProfile(userInfo);
    await anonymousUser.reload();
    // Have to re-call kFirebaseAuth.currentUser() to make `updateProfile` work.
    // https://stackoverflow.com/questions/50986191/flutter-firebase-auth-updateprofile-method-is-not-working.
    final user = AuthService._getCurrentUser();
    kFirebaseAnalytics.logLogin();
    return user;
  }

  static Future<Null> _signOut() async {
    kUser = null;
    kFirebaseAuth.signOut();
  }

  static Future<FirebaseUser> _getCurrentUser() async{
    return await kFirebaseAuth.currentUser();
  }
}