import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gradients/flutter_gradients.dart';

import '../widgets/bottom_navbar.dart';

class ProfileScreen extends StatelessWidget {
  static const routeName = '/ProfileScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Color(0xFF6794db),
      //   elevation: 0,
      //   title: Text(
      //     'PROFILE',
      //   ),
      //   centerTitle: true,
      // ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Card(
              elevation: 10,
              margin: EdgeInsets.zero,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.39,
                decoration: BoxDecoration(
                  gradient: FlutterGradients.flyHigh(
                    type: GradientType.linear,
                    tileMode: TileMode.clamp,
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        top: MediaQuery.of(context).padding.top + 2,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: IconButton(
                              icon: Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              ),
                              onPressed: () => Navigator.of(context).pop(),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Text(
                              'PROFILE',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Spacer(),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      maxRadius: 50,
                      child: Hero(
                        tag: 'profile',
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.network(
                            FirebaseAuth.instance.currentUser.photoURL,
                          ),
                        ),
                      ),
                    ),
                    profileText(
                      FirebaseAuth.instance.currentUser.displayName,
                    ),
                    profileText(
                      FirebaseAuth.instance.currentUser.email,
                    ),
                    profileText(
                      FirebaseAuth.instance.currentUser.phoneNumber ?? 'Phone Number Not Available',
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Text('My Cases'),
          ],
        ),
      ),
      bottomNavigationBar: BottomBar(),
    );
  }

  Container profileText(String text) {
    return Container(
      margin: EdgeInsets.only(
        top: 10,
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 18,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
