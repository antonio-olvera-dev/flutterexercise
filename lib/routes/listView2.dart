import 'package:flutter/material.dart';

class ListViewExample2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView2'),
      ),
      body: Container(
        child: Body(),
      ),
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
    final items = List<String>.generate(10000, (count) => "Rodolfo $count");
    return ListView.builder(
      itemBuilder: (context, index) {
        return Card(
          shadowColor: Colors.black87,
          elevation: 3,
          borderOnForeground: true,
          margin: EdgeInsets.all(8),
          child: ListTile(
            onTap: () {
              print('$index');
            },
            tileColor: Colors.blue[300],
            title: Text(
              '${items[index]}',
              style: TextStyle(color: Colors.white),
            ),
            subtitle:
                Text('Mensajes :)', style: TextStyle(color: Colors.white60)),
          ),
        );
      },
    );
  }
}
