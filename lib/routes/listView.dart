import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListViewExample extends StatefulWidget {
  @override
  _ListViewExampleState createState() => _ListViewExampleState();
}

class _ListViewExampleState extends State<ListViewExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView'),
      ),
      body: Container(
        color: Colors.blue[200],
        child: ListView(
          children: simular(),
        ),
      ),
    );
  }
}

List<Card> simular() {
  List<Card> array = [];
  for (var i = 0; i < 50; i++) {
    array.add(Card(
        'Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno'));
  }
  return array;
}

class Card extends StatelessWidget {
  final String text;
  Card(
    this.text, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          color: Colors.blue[100],
          border: Border.all(color: Colors.white)),
      margin: EdgeInsets.all(15),
      child: Text(
        '$text',
        style: TextStyle(
          color: Colors.blue[900],
          fontSize: 16,
        ),
      ),
    );
  }
}
