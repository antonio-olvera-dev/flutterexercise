import 'package:flutter/material.dart';

class BottomNavigationBarExample extends StatefulWidget {
  @override
  _BottomNavigationBarExampleState createState() =>
      _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState
    extends State<BottomNavigationBarExample> {
  int index = 0;
  List<Widget> lista = <Widget>[
    Container(
      child: Center(
        child: Icon(Icons.home),
      ),
    ),
    Container(
      child: Center(
        child: Icon(Icons.monetization_on),
      ),
    ),
    Container(
      child: Center(
        child: Icon(Icons.business),
      ),
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BottomNavigationBar'),
      ),
      body: Container(
        child: lista.elementAt(index),
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
            textTheme: Theme.of(context)
                .textTheme
                .copyWith(caption: TextStyle(color: Colors.white))),
        child: BottomNavigationBar(
          backgroundColor: Colors.black,
          fixedColor: Colors.blue,
          iconSize: 30,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.monetization_on,
              ),
              label: 'Money',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.business,
              ),
              label: 'Business',
            ),
          ],
          currentIndex: index,
          onTap: (i) {
            setState(() {
              index = i;
            });
          },
        ),
      ),
    );
  }
}
