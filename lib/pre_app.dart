import 'dart:developer';
import 'package:HiMech/userDashboard.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'Authentications/SignUp.dart';


class PreApp extends StatelessWidget {
  const PreApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(), // when user changes builder will run again
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
                  child: CircularProgressIndicator(),
                );
        } else if (snapshot.hasError) {
          log(snapshot.error.toString());
          return  Center(child: Text(snapshot.error.toString()));
        } else if (snapshot.hasData) { // user is logged in
          return const userDashboard();
        } else { //user is null
          return const SignUp();
        }
      },
    );
  }
}