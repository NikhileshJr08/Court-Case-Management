import 'package:flutter/material.dart';

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
                  color: const Color(0xFF3700b3),
                ),
                onPressed: () {},
                splashRadius: 25,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(right: 25.0),
              child: IconButton(
                icon: Icon(
                  Icons.more_vert_sharp,
                  color: Color(0xFF3700b3),
                ),
                splashRadius: 25,
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
