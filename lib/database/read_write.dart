import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


Future<bool> addUser(String uid) async{
  final docRef = FirebaseFirestore.instance.collection('users').doc(uid);
  final doc = await docRef.get();

  if (doc.exists) {
    // User already exists in Firestore
    print("already exists not adding uid");
    return false;
  }

  // Create new user document
  await docRef.set({
    'createdAt': FieldValue.serverTimestamp(),
    'uid': uid,
    'username': "default",
  });

  return true;
}

