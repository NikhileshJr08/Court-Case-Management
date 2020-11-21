import 'package:court_case_management_mobile_app/widgets/bottom_navbar.dart';
import 'package:court_case_management_mobile_app/widgets/floating_action_button.dart';
import 'package:flutter/material.dart';

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
            TitleBar(),
            SliverList(
              delegate: SliverChildListDelegate([
                SizedBox(
                  height: 1000,
                ), //will be removed just placeholder
              ]),
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
