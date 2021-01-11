import 'package:flutter/material.dart';

class HearingScreen extends StatelessWidget {
  static const routeName = '/hearing-details';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: MediaQuery.of(context).size.height * 0.2,
        title: Text(
          'Hearings for the case ...',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
          textAlign: TextAlign.center,
        ),
        elevation: 10,
      ),
    );
  }
}
