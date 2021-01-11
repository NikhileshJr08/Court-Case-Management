import 'package:auto_size_text/auto_size_text.dart';
import 'package:court_case_management_mobile_app/screens/case_detail_screen.dart';
import 'package:flutter/material.dart';

class MyCases extends StatefulWidget {
  @override
  _MyCasesState createState() => _MyCasesState();
}

class _MyCasesState extends State<MyCases> {
  int changeSize = 0;

  void changeChangeSize() {
    setState(() {
      changeSize = 1;
    });
    Future.delayed(
      Duration(milliseconds: 300),
    ).then((value) {
      if (changeSize == 1)
        setState(() {
          changeSize = 0;
        });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragDown: (_) => changeChangeSize(),
      onHorizontalDragStart: (_) => changeChangeSize(),
      onTapDown: (_) => changeChangeSize(),
      onTapCancel: () => changeChangeSize(),
      onTap: () {
        Navigator.of(context).pushNamed(CaseDetailScreen.routeName);
      },
      child: AnimatedContainer(
        curve: Curves.easeOut,
        duration: Duration(milliseconds: 300),
        padding: changeSize == 0
            ? EdgeInsets.only(
                left: 15,
                right: 15,
                top: 5,
                bottom: 5,
              )
            : EdgeInsets.only(
                left: 10,
                right: 10,
                top: 5,
                bottom: 5,
              ),
        child: Card(
          shadowColor: Colors.white,
          elevation: 8,
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        'Case ID',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: AutoSizeText(
                        'owijflakjfo320sdgasfasfasfaf',
                        maxLines: 2,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Case Name',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    AutoSizeText(
                      'Dont take Engineeringsdggggggggggggggggggggggggggggggg',
                      maxLines: 3,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
