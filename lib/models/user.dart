import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String username;
  final String uid;
  final String email;
  final String bio;
  final String photoUrl;
  final List followers;
  final List following;

  const User({
    required this.username,
    required this.uid,
    required this.email,
    required this.bio,
    required this.photoUrl,
    required this.followers,
    required this.following,
  });

  User.empty()
      : bio = '',
        photoUrl = '',
        uid = '',
        followers = [],
        following = [],
        email = '',
        username = '';

  Map<String, dynamic> toJson() => {
        'username': username,
        'uid': uid,
        'email': email,
        'bio': bio,
        'followers': followers,
        'following': following,
        'photoUrl': photoUrl
      };

  static User fromSnap(DocumentSnapshot snapshot) {
    var snap = snapshot.data() as Map<String, dynamic>;

    return User(
        username: snap['username'],
        uid: snap['uid'],
        email: snap['email'],
        bio: snap['bio'],
        photoUrl: snap['photoUrl'],
        followers: snap['followers'],
        following: snap['following']);
  }
}
