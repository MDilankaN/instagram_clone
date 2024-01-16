import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:instagram_clone/models/user.dart' as UserModal;
import 'package:instagram_clone/resources/storage_methods.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //Sigin up
  Future<String> signUpUser({
    required String email,
    required String password,
    required String username,
    required String bio,
    required Uint8List file,
  }) async {
    String res = 'Some Error occured';
    try {
      if (email.isNotEmpty &&
          password.isNotEmpty &&
          username.isNotEmpty &&
          bio.isNotEmpty) {
        UserCredential credential = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        String profileImageUrl = await StorageMethods()
            .uploadImageToStorage('profileImages', file, true);

        UserModal.User userObj = UserModal.User(
            username: username,
            uid: credential.user!.uid,
            email: email,
            bio: bio,
            photoUrl: profileImageUrl,
            followers: [],
            following: []);
        await _firestore
            .collection('users')
            .doc(credential.user!.uid)
            .set(userObj.toJson());
        res = 'success';
      }
      return res;
    } on FirebaseAuthException catch (err) {
      if (err.code == 'invlid-email') {
        res = 'The Email is invalid';
      }
      return res;
    } catch (err) {
      res = err.toString();
      return res;
    }
  }

  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String res = 'Some Error occured';
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        res = 'success';
      } else {
        res = 'Please fill all the fields';
      }
      return res;
    } catch (err) {
      return res = err.toString();
    }
  }
}
