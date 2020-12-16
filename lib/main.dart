import 'package:exercises/routes/Icons.dart';
import 'package:exercises/routes/alert.dart';
import 'package:exercises/routes/buttons.dart';
import 'package:exercises/routes/datePiker.dart';
import 'package:exercises/routes/images.dart';
import 'package:exercises/routes/listView.dart';
import 'package:exercises/routes/listView2.dart';
import 'package:exercises/routes/sliverAppBar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'My exercises',
    home: MyExercise(),
    initialRoute: '/',
    routes: {
      '/icons': (context) => ExerciseIcons(),
      '/listView': (context) => ListViewExample(),
      '/listView2': (context) => ListViewExample2(),
      '/buttons': (context) => ButtonExample(),
      '/images': (context) => Imagenes(),
      '/datePicker': (context) => DatePikerExaple(),
      '/alert': (context) => AlertExample(),
      '/sliverAppBar': (context) => SliverExample(),
    },
  ));
}

class MyExercise extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(),
      body: Body(),
    );
  }

  AppBar header() {
    return AppBar(
      title: Text(
        'My exercises',
      ),
      leading: IconButton(
        icon: Icon(Icons.menu),
        color: Colors.white,
        onPressed: () {},
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.search),
          tooltip: 'Search',
          onPressed: () {},
        ),
      ],
    );
  }
}

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.white,
      child: ListView(
        children: [
          Botones(
            'Icons',
            colorText: Colors.white,
            colorButton: Colors.cyan,
            ruta: 'icons',
          ),
          Botones(
            'ListView Manual',
            colorText: Colors.white,
            colorButton: Colors.blue,
            ruta: 'listView',
          ),
          Botones(
            'ListView "Tareas pesadas"',
            colorText: Colors.white,
            colorButton: Colors.cyan,
            ruta: 'listView2',
          ),
          Botones(
            'Buttons',
            colorText: Colors.white,
            colorButton: Colors.blue,
            ruta: 'buttons',
          ),
          Botones(
            'Imagenes',
            colorText: Colors.white,
            colorButton: Colors.cyan,
            ruta: 'images',
          ),
          Botones(
            'DatePicker',
            colorText: Colors.white,
            colorButton: Colors.blue,
            ruta: 'datePicker',
          ),
          Botones(
            'Alert',
            colorText: Colors.white,
            colorButton: Colors.cyan,
            ruta: 'alert',
          ),
          Botones(
            'SliverAppBar',
            colorText: Colors.white,
            colorButton: Colors.blue,
            ruta: 'sliverAppBar',
          ),
        ],
      ),
    );
  }
}

class Botones extends StatelessWidget {
  final Color colorText;
  final Color colorButton;
  final String texto;
  final String ruta;

  Botones(
    this.texto, {
    Key key,
    this.colorText,
    this.colorButton,
    this.ruta,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: RaisedButton(
        onPressed: () {
          Navigator.pushNamed(context, '/${this.ruta}');
        },
        child: Text(
          this.texto,
          style: TextStyle(fontSize: 20, color: this.colorText),
        ),
        color: this.colorButton,
      ),
    );
  }
}
