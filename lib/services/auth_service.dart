import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:doom_covid/screens/initial_screen.dart';
import 'package:doom_covid/screens/login_screen.dart';

class AuthService {
  //Handles Auth
  handleAuth() {
    return StreamBuilder(
        stream: FirebaseAuth.instance.onAuthStateChanged,
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            return InitialScreen();
          } else {
            return LoginScreen();
          }
        });
  }

  //Sign out
  signOut() {
    FirebaseAuth.instance.signOut();
  }

  //SignIn
  signIn(AuthCredential authCredits) {
    FirebaseAuth.instance.signInWithCredential(authCredits);
  }

  signInWithOTP(smsCode, verId) {
    AuthCredential authCredits = PhoneAuthProvider.getCredential(
        verificationId: verId, smsCode: smsCode);
    signIn(authCredits);
  }
}