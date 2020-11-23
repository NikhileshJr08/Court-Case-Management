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
        print('hello');
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
                    Text(
                      'Case ID',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text('owijflakjfo320'),
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
                    Text('Dont take Engineering'),
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
