import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


Future<bool> addUser(String uid) async{
  final docRef = FirebaseFirestore.instance.collection('users').doc(uid);
  final doc = await docRef.get();
  final docfriend = FirebaseFirestore.instance.collection('friends').doc(uid);

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
    'couple': null,
  });

  //add new user id to friends and friend requests list
  await docfriend.set({
    'friends': [],
    'friend_requests': {
      'incoming': [],
      'outgoing': [],
    },
  });


  return true;
}


//checks if username exists and rejects or updates based on that
Future<bool> changeUserName(String uid, String username) async{
  final result = await FirebaseFirestore.instance
    .collection('users')
    .where('username', isEqualTo: username)
    .limit(1)
    .get();

  if (result.docs.isNotEmpty) {
     return false;
  }

  await FirebaseFirestore.instance
    .collection('users')
    .doc(uid)
    .set({
      'username': username,
    }, SetOptions(merge: true));

  return true;
}


Future<String?> getUsername() async {
  final uid = FirebaseAuth.instance.currentUser!.uid;

  final doc = await FirebaseFirestore.instance
      .collection('users')
      .doc(uid)
      .get();

  if (!doc.exists) return null;

  return doc.data()?['username'];
}
