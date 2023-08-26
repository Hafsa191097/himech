import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthentication{
  FirebaseAuth _auth = FirebaseAuth.instance;
  Future<void> createUserWithEmailAndPassword(String email, String password)async {
      try {
        await _auth.createUserWithEmailAndPassword(email: email, password: password);
      }on FirebaseAuthException catch (e) {
        log(e.toString());
      }catch (_){}
    }
  Future<void> signinUserWithEmailAndPassword(String email, String password)async {
      try {
        await _auth.signInWithEmailAndPassword(email: email, password: password);
      }on FirebaseAuthException catch (e) {
         log(e.toString());
      }catch (_){}
    
  }
   Future<void> signOut() async {
    await _auth.signOut();
  }

  Future<bool> checkAdminEmailExists(String email) async {
    try{
      QuerySnapshot querysnapshot = await FirebaseFirestore.instance.collection('Admin Users').where('AdminEmail', isEqualTo: email).limit(1).get();
      return querysnapshot.docs.isNotEmpty;
    }catch(e){
      return false;
    }
  }

}