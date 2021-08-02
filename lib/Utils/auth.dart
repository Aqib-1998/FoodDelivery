import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
final _firebaseAuth = FirebaseAuth.instance;
// ignore: camel_case_types


class giveUser {
  giveUser({@required this.uid});
  final String uid;
}

abstract class AuthBase {
  Stream<giveUser> get onAuthStateChanged;
  Future<giveUser> currentUser();
  Future<giveUser> signInWithGoogle();
  Future<void> signOut();
}

class Auth implements AuthBase {
  giveUser _userFromFirebase(User user) {
    if (user == null) {
      return null;
    }
    return giveUser(uid: user.uid);
  }

  @override
  Stream<giveUser> get onAuthStateChanged {
    return _firebaseAuth.authStateChanges().map(_userFromFirebase);
  }


  @override
  Future<giveUser> currentUser() async {

    final user = _firebaseAuth.currentUser;

    return _userFromFirebase(user);
  }

  @override
  Future<giveUser> signInWithGoogle() async {
    await Firebase.initializeApp();
    final googleSignIn = GoogleSignIn();
    final googleAccount = await googleSignIn.signIn();
    if (googleAccount != null) {
      final googleAuth = await googleAccount.authentication;
      if (googleAuth.accessToken != null && googleAuth.idToken != null) {
        final authResult = await _firebaseAuth.signInWithCredential(
          GoogleAuthProvider.credential(
            idToken: googleAuth.idToken,
            accessToken: googleAuth.accessToken,
          ),
        );
        return _userFromFirebase(authResult.user);
      } else {
        throw PlatformException(
          code: 'ERROR_MISSING_GOOGLE_AUTH_TOKEN',
          message: 'Missing Google Auth Token',
        );
      }
    } else {
      throw PlatformException(
        code: 'ERROR_ABORTED_BY_USER',
        message: 'Sign in aborted by user',
      );
    }
  }

  @override
  Future<void> signOut() async {
    await Firebase.initializeApp();
    await _firebaseAuth.signOut();
    final googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();
  }
}
