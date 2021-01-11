import 'package:court_case_management_mobile_app/widgets/search_button.dart';
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
        drawer: NavDrawer(),
        backgroundColor: Colors.white,
        body: CustomScrollView(
          // physics: const BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.white,
              expandedHeight: MediaQuery.of(context).size.height * 0.28 -
                  MediaQuery.of(context).padding.top -
                  MediaQuery.of(context).padding.bottom,
              leading: IconButton(
                icon: Icon(
                  Icons.menu,
                  color: Colors.black,
                ),
                onPressed: () => NavDrawer(),
              ),
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
                                '\n\nWith this App Users have the facility to manage court documents like adding a case, adding lawyers(choosing from existing lawyers by paying the fees) to your cases, View Case Details, and much more. In short this App provides end to end management of Court Cases.',
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
                  FractionallySizedBox(
                    widthFactor: 0.6,
                    child: Container(
                      height: 50,
                      child: RaisedButton(
                        color: Colors.blue,
                        child: Text(
                          'HON\'BLE Judges',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                        onPressed: () {},
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                  SearchButton(),
                  Container(
                    margin: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                      bottom: 20,
                    ),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'About Madras High Court',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                            text:
                                '\n\nThe High Court of Judicature at Madras, one of the three High Courts in India established at the Presidency Towns by Letters Patent granted by Her Majesty Queen Victoria, bearing date 26th June 1862',
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
                  FractionallySizedBox(
                    widthFactor: 0.5,
                    child: Container(
                      height: 50,
                      child: RaisedButton(
                        color: Colors.blue,
                        child: Text(
                          'Services',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                        onPressed: () {},
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Divider(
                    thickness: 1,
                    color: Colors.black87,
                    endIndent: MediaQuery.of(context).size.width * 0.07,
                    indent: MediaQuery.of(context).size.width * 0.07,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Copyright \u00a9 2021 \nChennai Sharks',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 35,
                  ),
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
