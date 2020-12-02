import 'package:flutter/material.dart';

import '../widgets/nav_drawer.dart';
import '../widgets/bottom_navbar.dart';
import '../widgets/floating_action_button.dart';
import '../widgets/title_bar.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.white,
              expandedHeight: MediaQuery.of(context).size.height * 0.28 -
                  MediaQuery.of(context).padding.top -
                  MediaQuery.of(context).padding.bottom,
              flexibleSpace: FlexibleSpaceBar(
                stretchModes: [
                  StretchMode.zoomBackground,
                  StretchMode.blurBackground,
                  StretchMode.fadeTitle,
                ],
                background: Image.asset(
                  'assets/images/court_appbar.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              floating: false,
              pinned: false,
              stretch: false,
            ),
            TitleBar(
              title: 'Court Case Manager',
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Container(
                    margin: const EdgeInsets.all(20),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Welcome to Court Case Manager App!',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                            text:
                                '\n\nWith this App Users have the facility to record information like adding a case, adding lawyers(choosing from existing lawyers by paying the fees) to your cases, View Case Details, and much more. In short this App provides end to end management of Court Cases.',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 1000,
                  ), //placeholder for scrolling
                ],
              ),
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingButton(),
        bottomNavigationBar: BottomBar(),
      ),
    );
  }
}
