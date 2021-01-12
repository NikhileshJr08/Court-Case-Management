import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gradients/flutter_gradients.dart';

import '../widgets/my_cases_widget.dart';
import '../widgets/bottom_navbar.dart';

class ProfileScreen extends StatefulWidget {
  static const routeName = '/ProfileScreen';

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              elevation: 10,
              margin: EdgeInsets.zero,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.39,
                decoration: BoxDecoration(
                  gradient: FlutterGradients.flyHigh(
                    type: GradientType.linear,
                    tileMode: TileMode.clamp,
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        top: MediaQuery.of(context).padding.top + 2,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: IconButton(
                              icon: Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              ),
                              onPressed: () => Navigator.of(context).pop(),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Text(
                              'PROFILE',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Spacer(),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      maxRadius: 50,
                      child: Hero(
                        tag: 'profile',
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.network(
                            FirebaseAuth.instance.currentUser.photoURL,
                          ),
                        ),
                      ),
                    ),
                    profileText(
                      FirebaseAuth.instance.currentUser.displayName,
                    ),
                    profileText(
                      FirebaseAuth.instance.currentUser.email,
                    ),
                    profileText(
                      FirebaseAuth.instance.currentUser.phoneNumber ?? 'Phone Number Not Available',
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 15),
            Text(
              'My Cases',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            MyCases(),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showGeneralDialog(
              barrierDismissible: true,
              barrierLabel: 'hello',
              context: context,
              pageBuilder: (ctx, _, __) {
                return Dialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ), //this right here
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 8),
                        alignment: Alignment.center,
                        child: AutoSizeText(
                          'Add A New Case',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                          maxLines: 2,
                        ),
                      ),
                      addFieldsForAddingCase(
                        leadingTitle: 'Case Id:',
                      ),
                      addFieldsForAddingCase(
                        leadingTitle: 'Case Name:',
                      ),
                      addFieldsForAddingCase(
                        leadingTitle: 'Party Name:',
                      ),
                      addFieldsForAddingCase(
                        leadingTitle: 'FIR No. : ',
                      ),
                      addFieldsForAddingCase(
                        leadingTitle: 'Prosecutor:',
                      ),
                      addFieldsForAddingCase(
                        leadingTitle: 'Defendant:',
                      ),
                      addFieldsForAddingCase(
                        leadingTitle: 'Defense Lawyer:',
                      ),
                      addFieldsForAddingCase(
                        leadingTitle: 'Status:',
                      ),
                      addFieldsForAddingCase(
                        leadingTitle: 'Case Type:',
                      ),
                      addFieldsForAddingCase(
                        leadingTitle: 'Verdict:',
                      ),
                      Divider(thickness: 1),
                      GestureDetector(
                        onTap: () => Navigator.of(ctx).pop(),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.only(
                                  bottom: 5,
                                ),
                                child: FlatButton(
                                  onPressed: () => Navigator.of(ctx).pop(),
                                  child: Text(
                                    'OK',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: Colors.blue,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }).then((value) {
            setState(() {});
          });
        },
        tooltip: 'Add a New Case',
        child: Icon(
          Icons.add,
        ),
      ),
      bottomNavigationBar: BottomBar(),
    );
  }

  Row addFieldsForAddingCase({
    String leadingTitle,
    TextEditingController controller,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 2,
          child: Container(
            margin: const EdgeInsets.only(left: 5, right: 3),
            alignment: Alignment.center,
            child: AutoSizeText(
              leadingTitle,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
            ),
          ),
        ),
        Expanded(
          flex: 4,
          child: Container(
            margin: const EdgeInsets.only(
              right: 20,
            ),
            child: TextField(
              controller: controller,
            ),
          ),
        )
      ],
    );
  }

  Container profileText(String text) {
    return Container(
      margin: EdgeInsets.only(
        top: 10,
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 18,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
