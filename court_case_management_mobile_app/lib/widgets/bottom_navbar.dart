import 'package:court_case_management_mobile_app/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../providers/auth.dart';

class BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      color: Colors.white,
      elevation: 10,
      child: Container(
        height: 55,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black,
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(left: 25.0),
              child: IconButton(
                iconSize: 30.0,
                icon: Icon(
                  Icons.home_outlined,
                  color: const Color(0xFF6794db),
                ),
                onPressed: () {},
                splashRadius: 25,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(right: 25.0),
              child: PopupMenuButton(
                icon: Icon(
                  Icons.more_horiz_outlined,
                  color: Color(0xFF6794db),
                ),
                onSelected: (value) async {
                  if (value == 1) {
                    final closeLoadingAfterLogout = context.showLoading(msg: 'Logging out...');
                    await Future.delayed(1.seconds, closeLoadingAfterLogout);
                    if (ModalRoute.of(context).settings.name == ProfileScreen.routeName) {
                      Navigator.of(context).pop();
                      await Auth.signout();
                    } else
                      await Auth.signout();
                  }
                },
                itemBuilder: (ctx) {
                  return [
                    PopupMenuItem(
                      child: const Text(
                        'Log Out',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                        ),
                      ),
                      value: 1,
                    ),
                  ];
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
