import 'package:flutter/material.dart';

class ExerciseIcons extends StatelessWidget {
  const ExerciseIcons({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Icons'),
      ),
      body: Body(),
    );
  }
}

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          IconosButtons(
              'Mantén pulsado el icono', Icons.push_pin, Colors.black12),
          IconosButtons(
            'Mantén pulsado highlightColor',
            Icons.push_pin,
            Colors.red,
            color: Colors.red,
            tamano: 40.0,
          ),
          Iconos('Icono normal', Icons.add_photo_alternate),
          Iconos('Size', Icons.add_photo_alternate, tamano: 50.0),
          Iconos('Color', Icons.add_photo_alternate, color: Colors.amber),
        ],
      ),
    );
  }
}

class IconosButtons extends StatelessWidget {
  final String texto;
  final IconData icons;
  final ColorSwatch color;
  final double tamano;
  final Color highlight;

  const IconosButtons(this.texto, this.icons, this.highlight,
      {Key key, this.color, this.tamano})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ColorSwatch colorF = this.color;
    double tamanoF = this.tamano;
    if (this.color == null) {
      colorF = Colors.green;
    }
    if (this.tamano == null) {
      tamanoF = 30.0;
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
            color: colorF,
            iconSize: tamanoF,
            icon: Icon(icons),
            tooltip: 'Información sobre lo pulsado',
            highlightColor: highlight,
            onPressed: () {}),
        Text(texto),
      ],
    );
  }
}

class Iconos extends StatelessWidget {
  final String texto;
  final IconData icons;
  final ColorSwatch color;
  final double tamano;
  const Iconos(this.texto, this.icons, {Key key, this.color, this.tamano})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ColorSwatch colorF = this.color;
    double tamanoF = this.tamano;
    if (this.color == null) {
      colorF = Colors.green;
    }
    if (this.tamano == null) {
      tamanoF = 30.0;
    }

    return Container(
      width: 150,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            this.icons,
            color: colorF,
            size: tamanoF,
          ),
          Text(
            this.texto,
          ),
        ],
      ),
    );
  }
}
