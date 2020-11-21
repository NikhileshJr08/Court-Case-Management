import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FloatingButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {},
      elevation: 2,
      tooltip: 'Profile Page',
      backgroundColor: Colors.white,
      child: CircleAvatar(
        backgroundColor: Colors.white,
        backgroundImage: NetworkImage(
          FirebaseAuth.instance.currentUser.photoURL,
        ),
      ),
    );
  }
}
