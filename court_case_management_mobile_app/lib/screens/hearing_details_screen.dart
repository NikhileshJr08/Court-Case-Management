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
      body: SingleChildScrollView(
        child: ListView(
          children: [
            DataTable(
              columns: [
                DataColumn(
                  label: Text('Date'),
                ),
                DataColumn(
                  label: Text('Judge'),
                ),
                DataColumn(
                  label: Text('Start Time'),
                ),
                DataColumn(
                  label: Text('End Time'),
                ),
                DataColumn(
                  label: Text('Next Hearing'),
                ),
              ],
              rows: [], //to be filled after the rest api is deployed and works properly.
            ),
          ],
        ),
      ),
    );
  }
}
