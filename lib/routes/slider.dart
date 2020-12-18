import 'package:flutter/material.dart';

class SliderExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider'),
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
  double valorActual = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Slider(
          activeColor: Colors.black,
          inactiveColor: Colors.black26,
          min: 0,
          max: 100,
          value: valorActual,
          divisions: 100,
          label: (valorActual.round()).toString(),
          onChanged: (valor) {
            setState(() {
              valorActual = valor;
            });
          },
        ),
      ),
    );
  }
}
