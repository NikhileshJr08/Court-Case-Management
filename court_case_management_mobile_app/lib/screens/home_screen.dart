import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Court Case Manager',
          // style: Theme.of(context).textTheme.headline4,
        ),
      ),
      body: Center(
        child: Text(
          'hello',
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
    );
  }
}
