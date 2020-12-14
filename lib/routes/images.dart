import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Imagenes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Images'),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 15),
        child: Container(
          alignment: Alignment.center,
          child: ListView(
            children: [
              Futuro(),
              Text(
                'Cargada en red',
                textAlign: TextAlign.center,
              ),
              Image(
                image: NetworkImage(
                    'https://pm1.narvii.com/6429/b31f6f6384e4bbbd498c33c30feb4b0d64493999_00.jpg'),
              ),
              Text(
                'Cargada desde los assets',
                textAlign: TextAlign.center,
              ),
              Image(
                image: AssetImage('assets/meme.jpg'),
              ),
              Text(
                'Cargada desde los assets',
                textAlign: TextAlign.center,
              ),
              Image(
                image: AssetImage('assets/green.png'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Futuro extends StatefulWidget {
  const Futuro({
    Key key,
  }) : super(key: key);

  @override
  _FuturoState createState() => _FuturoState();
}

class _FuturoState extends State<Futuro> {
  Future<String> _retard = Future<String>.delayed(
    Duration(seconds: 2),
    () => 'Ok',
  );
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _retard,
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          if (snapshot.hasData) {
            return Padding(
              padding: EdgeInsets.all(15),
              child: Text(
                'Imagenes cargada correctamente',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.green),
              ),
            );
          } else {
            return CupertinoActivityIndicator();
          }
        });
  }
}
