import 'package:http/http.dart' as http;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class Auth with ChangeNotifier {
  final googleSignIn = GoogleSignIn();
  bool _isSigningIn;

  List data = [];

  List get datas {
    return [...data];
  }

  GoogleSignInProvider() {
    _isSigningIn = false;
  }

  bool get isSigningIn => _isSigningIn;

  set isSigningIn(bool isSigningIn) {
    _isSigningIn = isSigningIn;
    notifyListeners();
  }

  Future login() async {
    isSigningIn = true;

    //  print('t');

    final user = await googleSignIn.signIn();
    if (user == null) {
      isSigningIn = false;
      return;
    } else {
      final googleAuth = await user.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);

      isSigningIn = false;
    }
  }

  List getitemcount() {
    var count = 0;
    data = [];
    CollectionReference ref = FirebaseFirestore.instance.collection('Items');
    ref.get().then((QuerySnapshot snapshot) {
      snapshot.docs.forEach((element) {
        print(element.data());
        data.add(element.data());

        count++;

        //   print(count);
      });
    });
    // print(count);
    return data;
  }

  Future<void> addItems(Map<String, String> item) async {
    print(item['name']);
    CollectionReference ref = FirebaseFirestore.instance.collection('Items');

    ref.add({
      'name': item['name'],
      'description': item['description'],
      'created': item['created'],
      'enddate': item['end'],
      'price': item['minBidPrice']
    });
  }

  void logout() async {
    await googleSignIn.disconnect();
    FirebaseAuth.instance.signOut();
  }
}
