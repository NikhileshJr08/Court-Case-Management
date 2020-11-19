import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Court Case Manager',
        ),
      ),
      body: Column(
        children: [
          Center(
            child: Text(
              'hello',
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          RaisedButton(
            onPressed: () => print('nlsk'),
          )
        ],
      ),
    );
  }
}
