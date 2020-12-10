import 'package:exercises/routes/Icons.dart';
import 'package:exercises/routes/listView.dart';
import 'package:exercises/routes/listView2.dart';
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
            'Boton 4',
            colorText: Colors.white,
            colorButton: Colors.blue,
          ),
          Botones(
            'Boton 5',
            colorText: Colors.white,
            colorButton: Colors.cyan,
          ),
          Botones(
            'Boton 6',
            colorText: Colors.white,
            colorButton: Colors.blue,
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
