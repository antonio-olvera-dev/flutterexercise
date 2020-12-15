import 'package:flutter/material.dart';

class AlertExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert'),
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
  @override
  Widget build(BuildContext context) {
    snack(String text) {
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [Icon(Icons.notification_important), Text(text)],
          ),
          duration: Duration(seconds: 3),
          action: SnackBarAction(
            label: 'Ok',
            onPressed: () {},
          ),
        ),
      );
    }

    return Center(
      child: Container(
        child: RaisedButton(
          onPressed: () {
            showDialog(
              barrierDismissible: true,
              context: context,
              builder: (context) => AlertDialog(
                actions: [
                  Row(
                    children: [
                      FlatButton(
                        onPressed: () {
                          snack('Elección errónea');
                          Navigator.pop(context);
                        },
                        child: Text('Cancelar'),
                      ),
                      FlatButton(
                        onPressed: () {
                          snack('Buena elección!');
                          Navigator.pop(context);
                        },
                        child: Text('Aceptar'),
                        color: Theme.of(context).primaryColor,
                      ),
                    ],
                  )
                ],
                content: Text('Te ofrecemos un servicio y precio inigualable'),
                title: Text('¿Desea contratar nuestros servicios?'),
              ),
            );
          },
          color: Colors.blue[800],
          child: Text(
            'Alert',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
