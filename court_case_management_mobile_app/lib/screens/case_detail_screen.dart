import 'package:court_case_management_mobile_app/screens/hearing_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class CaseDetailScreen extends StatelessWidget {
  static const routeName = '/case-detail';

  Widget buildSmallTiles({String title, String value, BuildContext context}) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.13,
      margin: const EdgeInsets.all(10),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 10,
        shadowColor: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5.0, right: 5),
              child: AutoSizeText(
                value,
                style: TextStyle(
                  fontSize: 15,
                ),
                maxLines: 3,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row buildSmallTileRowWhichHasTwoSmallTiles({Widget first, Widget second}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: first,
        ),
        Expanded(
          child: second,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: MediaQuery.of(context).size.height * 0.2,
        title: Text(
          'Case Details',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
          textAlign: TextAlign.center,
        ),
        elevation: 10,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 10,
            ),
            buildSmallTileRowWhichHasTwoSmallTiles(
              first: buildSmallTiles(
                context: context,
                title: 'Case Id:',
                value: '1234q3423423333333333333333333333333333333333333333',
              ),
              second: buildSmallTiles(
                context: context,
                title: 'Party Name:',
                value: '1234q3423423333333333333333333333333333333333333333',
              ),
            ),
            buildSmallTileRowWhichHasTwoSmallTiles(
              first: buildSmallTiles(
                context: context,
                title: 'FIR No. : ',
                value: '1234q3423423333333333333333333333333333333333333333',
              ),
              second: buildSmallTiles(
                context: context,
                title: 'Prosecutor:',
                value: '1234q3423423333333333333333333333333333333333333333',
              ),
            ),
            buildSmallTileRowWhichHasTwoSmallTiles(
              first: buildSmallTiles(
                context: context,
                title: 'Defendant:',
                value: '1234q3423423333333333333333333333333333333333333333',
              ),
              second: buildSmallTiles(
                context: context,
                title: 'Defense Lawyer:',
                value: '1234q3423423333333333333333333333333333333333333333',
              ),
            ),
            buildSmallTileRowWhichHasTwoSmallTiles(
              first: buildSmallTiles(
                context: context,
                title: 'Status:',
                value: '1234q3423423333333333333333333333333333333333333333',
              ),
              second: buildSmallTiles(
                context: context,
                title: 'Case Type',
                value: '1234q3423423333333333333333333333333333333333333333',
              ),
            ),
            FractionallySizedBox(
              widthFactor: 0.8,
              child: Container(
                height: 50,
                child: RaisedButton(
                  color: Colors.blue,
                  child: Text(
                    'Click to See Hearing Details',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () => Navigator.pushNamed(context, HearingScreen.routeName),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            buildSmallTiles(
              context: context,
              title: 'Verdict:',
              value: '1234q3423423333333333333333333333333333333333333333',
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
