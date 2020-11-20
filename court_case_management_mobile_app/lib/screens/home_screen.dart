import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            expandedHeight: MediaQuery.of(context).size.height * 0.29 -
                MediaQuery.of(context).padding.top -
                MediaQuery.of(context).padding.bottom,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                'Court Case Manager',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              centerTitle: true,
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
            floating: true,
            pinned: true,
            stretch: true,
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              SizedBox(
                height: 1000,
              ), //will be removed just placeholder
            ]),
          ),
        ],
      ),
    );
  }
}
