import 'dart:math';

import 'package:flutter/material.dart';

class TweenAnimationBuilderExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TweenAnimationBuilder'),
      ),
      body: Body(),
    );
  }
}

class Body extends StatefulWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  double valRot = 30;
  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
        child: Center(
          child: TweenAnimationBuilder(
            tween: Tween<double>(begin: 0, end: valRot),
            duration: Duration(milliseconds: 2000),
            curve: Curves.bounceInOut,
            builder: (_, double rotacion, __) {
              return Transform(
                  transform: Matrix4.translationValues(10, rotacion * 2, 15),
                  child: Text('Texto Rotando'));
            },
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 90),
        child: RaisedButton(
            child: Text('Click me'),
            onPressed: () {
              setState(() {
                valRot = Random().nextDouble() * 100;
              });
            }),
      )
    ]);
  }
}
