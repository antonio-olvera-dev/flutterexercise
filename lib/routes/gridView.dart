import 'package:flutter/material.dart';

class GridViewExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GridView'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        padding: const EdgeInsets.all(10),
        children: simular(),
      ),
    );
  }

  List<Cartas> simular() {
    List<Cartas> cartas = [];
    for (var i = 0; i < 20; i++) {
      cartas.add(Cartas());
    }
    return cartas;
  }
}

class Cartas extends StatelessWidget {
  const Cartas({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 8),
              child: Text(
                'Van Helsing',
                style: TextStyle(
                    color: Colors.blue[900],
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Text(
                'Película estadounidense de 2004 dirigida por Stephen Sommers.'),
            Container(
              margin: EdgeInsets.only(left: 78),
              child: Padding(
                padding: EdgeInsets.only(top: 12),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: FlatButton(
                    onPressed: () {},
                    child: Text(
                      'Ok',
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                    height: 20,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
