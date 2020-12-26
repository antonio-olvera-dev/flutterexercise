import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedSwitcherExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimatedSwitcher'),
      ),
      body: Body(),
    );
  }
}

class Body extends StatefulWidget {
  const Body({Key key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int ran = 255;
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          AnimatedSwitcher(
            duration: Duration(seconds: 1),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return ScaleTransition(
                child: child,
                scale: animation,
              );
            },
            child: Cuadrado(
              ran,
              key: ValueKey(ran),
            ),
          ),
          ElevatedButton(
            child: const Text('Press'),
            onPressed: () {
              setState(() {
                ran = Random().nextInt(255);
              });
            },
          )
        ]);
  }
}

class Cuadrado extends StatelessWidget {
  final int size;
  const Cuadrado(
    this.size, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          color: Color.fromARGB(255, size, 100, 0),
          height: 300,
          width: 300,
        ),
      ),
    );
  }
}
