import 'package:flutter/material.dart';

class SliverExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Lista> simular() {
      List<Lista> lista = [];
      for (var i = 0; i < 10; i++) {
        lista.add(Lista(i));
      }
      return lista;
    }

    return CustomScrollView(
      slivers: [
        SliverAppBar(
            expandedHeight: 300.0,
            flexibleSpace: const FlexibleSpaceBar(
              title: Text('SliverAppBar'),
              background: Image(
                image: AssetImage('assets/img1.jpg'),
                fit: BoxFit.fill,
              ),
            ),
            pinned: true,
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.add_circle),
                tooltip: 'Sin función estético',
                onPressed: () {},
              ),
            ]),
        //--------Descomentar para ver efectos-------------------------
        // SliverFixedExtentList(
        //   itemExtent: 100.0,
        //   delegate: SliverChildBuilderDelegate(
        //     (BuildContext context, int index) {
        //       return Lista(index);
        //     },
        //   ),
        // ),
//--------Comentar si descomentas la de arriba-------------------------
        SliverList(
          delegate: SliverChildListDelegate(
            simular(),
          ),
        ),
      ],
    );
  }
}

class Lista extends StatelessWidget {
  final num;
  const Lista(
    this.num, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var colorr = Colors.red;
    if ((num % 2) == 1) {
      colorr = Colors.amber;
    }
    return Container(
      color: colorr,
      height: 200,
      child: Center(
        child: Text(
          'Texto $num',
          style:
              TextStyle(color: Colors.white, decoration: TextDecoration.none),
        ),
      ),
    );
  }
}
