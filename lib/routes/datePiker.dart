import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DatePikerExaple extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DatePiker'),
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
  DateTime fecha = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      verticalDirection: VerticalDirection.up,
      children: [
        Padding(
          padding: EdgeInsets.all(20),
          child: Container(
            margin: EdgeInsets.only(bottom: 50),
            height: 150,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              initialDateTime: fecha,
              onDateTimeChanged: (date) {
                setState(() {
                  fecha = date;
                });
              },
            ),
          ),
        ),

        Texto(fecha: fecha)
      ],
    );
  }
}

class Texto extends StatelessWidget {
  const Texto({
    Key key,
    @required this.fecha,
  }) : super(key: key);

  final DateTime fecha;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Text(
        '${fecha.day}-${fecha.month}-${fecha.year}',
        style: TextStyle(color: Colors.blue[700], fontSize: 25),
      ),
    );
  }
}
