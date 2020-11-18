import 'package:court_case_management_mobile_app/providers/auth.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_gradients/flutter_gradients.dart';

class AuthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: FlutterGradients.flyHigh(
            type: GradientType.linear,
            tileMode: TileMode.clamp,
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      height: 60,
                      padding: EdgeInsets.all(10),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Image.asset(
                        'assets/images/icon_court.png',
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Container(
                      margin: EdgeInsets.only(left: 10),
                      child: AutoSizeText(
                        'Court Case Manager',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.08,
            ),
            Container(
              margin: EdgeInsets.only(
                left: 8,
                // right: 10,
              ),
              child: AutoSizeText(
                'Court Management for Everyone',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
            ),
            Container(
              //alignment: Alignment.center,
              width: MediaQuery.of(context).size.width * 0.75,
              height: 50,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0),
                ),
                color: Colors.white,
                elevation: 3,
                onPressed: () async {
                  //login code
                  await Auth.signIn();
                },
                child: Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        width: 35,
                        height: 35,
                        child: Image.asset(
                          'assets/images/google.png',
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Container(
                        margin: EdgeInsets.only(
                          left: 10,
                          right: 3,
                        ),
                        child: AutoSizeText(
                          ' SIGN IN WITH GOOGLE',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                          maxLines: 1,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
