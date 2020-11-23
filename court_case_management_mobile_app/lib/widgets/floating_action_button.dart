import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../screens/profile_screen.dart';

class FloatingButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        if (ModalRoute.of(context).settings.name == ProfileScreen.routeName) return;
        Navigator.of(context).pushNamed(ProfileScreen.routeName);
      },
      elevation: 10,
      tooltip: 'Profile Page',
      backgroundColor: Colors.white,
      heroTag: 'profile',
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Image.network(
          FirebaseAuth.instance.currentUser.photoURL,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
