import 'package:exercises/routes/Icons.dart';
import 'package:exercises/routes/alert.dart';
import 'package:exercises/routes/animation.dart';
import 'package:exercises/routes/animationContainer.dart';
import 'package:exercises/routes/bottomNavigationBar.dart';
import 'package:exercises/routes/buttons.dart';
import 'package:exercises/routes/datePiker.dart';
import 'package:exercises/routes/gridView.dart';
import 'package:exercises/routes/heroAnimation.dart';
import 'package:exercises/routes/images.dart';
import 'package:exercises/routes/listView.dart';
import 'package:exercises/routes/listView2.dart';
import 'package:exercises/routes/slider.dart';
import 'package:exercises/routes/sliverAppBar.dart';
import 'package:exercises/routes/tabBar.dart';
import 'package:exercises/routes/textField.dart';
import 'package:exercises/routes/tweenAnimationBuilder.dart';
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
      '/gridView': (context) => GridViewExample(),
      '/tabBar': (context) => TabBarExample(),
      '/bottomNavigationBarExample': (context) => BottomNavigationBarExample(),
      '/slider': (context) => SliderExample(),
      '/textField': (context) => TextFieldExample(),
      '/animation': (context) => AnimationExample(),
      '/animatedcontainer': (context) => AnimatedContainerExample(),
      '/tweenAnimationBuilder': (context) => TweenAnimationBuilderExample(),
      '/heroAnimation': (context) => HeroAnimationExample(),
    },
  ));
}

class MyExercise extends StatelessWidget {
  const MyExercise();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(),
      body: Body(),
      drawer: DrawerExample(),
    );
  }

  AppBar header() {
    return AppBar(
      title: Text(
        'My exercises',
      ),
      leading: Builder(
        builder: (ctx) => IconButton(
          icon: Icon(Icons.menu),
          color: Colors.white,
          onPressed: () {
            Scaffold.of(ctx).openDrawer();
          },
        ),
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

class DrawerExample extends StatelessWidget {
  const DrawerExample({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Drawer Header',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            title: Text('Silver App'),
            onTap: () {
              Navigator.pushNamed(context, '/sliverAppBar');
            },
          ),
          ListTile(
            title: Text('Grid View'),
            onTap: () {
              Navigator.pushNamed(context, '/gridView');
            },
          )
        ],
      ),
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
          Botones(
            'GridView',
            colorText: Colors.white,
            colorButton: Colors.cyan,
            ruta: 'gridView',
          ),
          Botones(
            'Tab Bar',
            colorText: Colors.white,
            colorButton: Colors.blue,
            ruta: 'tabBar',
          ),
          Botones(
            'BottomNavigationBar',
            colorText: Colors.white,
            colorButton: Colors.cyan,
            ruta: 'bottomNavigationBarExample',
          ),
          Botones(
            'Slider',
            colorText: Colors.white,
            colorButton: Colors.blue,
            ruta: 'slider',
          ),
          Botones(
            'TextField',
            colorText: Colors.white,
            colorButton: Colors.cyan,
            ruta: 'textField',
          ),
          Botones(
            'Animation',
            colorText: Colors.white,
            colorButton: Colors.blue,
            ruta: 'animation',
          ),
          Botones(
            'Animated Container',
            colorText: Colors.white,
            colorButton: Colors.cyan,
            ruta: 'animatedcontainer',
          ),
          Botones(
            'TweenAnimationBuilder',
            colorText: Colors.white,
            colorButton: Colors.blue,
            ruta: 'tweenAnimationBuilder',
          ),
          Botones(
            'Hero Animation',
            colorText: Colors.white,
            colorButton: Colors.cyan,
            ruta: 'heroAnimation',
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
