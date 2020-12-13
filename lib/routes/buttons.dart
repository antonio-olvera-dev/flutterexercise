import 'package:flutter/material.dart';

class ButtonExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buttons'),
      ),
      body: Body(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Raised(),
          Flat(),
          Outline(),
          DropDown(),
          PopuppMenuButton(),
          IconButtonss(),
        ],
      ),
    );
  }
}

class IconButtonss extends StatelessWidget {
  const IconButtonss({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20),
      child: IconButton(
        icon: Icon(Icons.ring_volume),
        onPressed: () {},
        color: Colors.orange,
        iconSize: 35,
      ),
    );
  }
}

enum WhyFarther { harder, smarter, selfStarter, tradingCharter }

class PopuppMenuButton extends StatefulWidget {
  const PopuppMenuButton({
    Key key,
  }) : super(key: key);

  @override
  _PopuppMenuButtonState createState() => _PopuppMenuButtonState();
}

class _PopuppMenuButtonState extends State<PopuppMenuButton> {
  dynamic _selection;
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<WhyFarther>(
      onSelected: (WhyFarther result) {
        setState(() {
          _selection = result;
          print(_selection);
        });
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<WhyFarther>>[
        const PopupMenuItem<WhyFarther>(
          value: WhyFarther.harder,
          child: Text('Compartir'),
        ),
        const PopupMenuItem<WhyFarther>(
          value: WhyFarther.smarter,
          child: Text('Ajustes'),
        ),
        const PopupMenuItem<WhyFarther>(
          value: WhyFarther.selfStarter,
          child: Text('Mas apps'),
        ),
        const PopupMenuItem<WhyFarther>(
          value: WhyFarther.tradingCharter,
          child: Text('Borrar'),
        ),
      ],
    );
  }
}

class DropDown extends StatefulWidget {
  const DropDown({
    Key key,
  }) : super(key: key);

  @override
  _DropDownState createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  String title = 'Madrid';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10),
      child: DropdownButton<String>(
        value: title,
        icon: Icon(Icons.location_city),
        iconSize: 24,
        elevation: 16,
        style: TextStyle(color: Colors.blue),
        underline: Container(
          height: 2,
          color: Colors.red,
        ),
        onChanged: (String newValue) {
          setState(() {
            title = newValue;
          });
        },
        items: <String>['Almería', 'Madrid', 'Barcelona', 'Cádiz']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}

class Outline extends StatelessWidget {
  const Outline({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonBar(
      alignment: MainAxisAlignment.start,
      children: [
        OutlineButton(
          onPressed: () {},
          child: Text('Outline Button'),
        ),
        OutlineButton(
          onPressed: () {},
          child: Text('Outline Button'),
          textColor: Colors.red,
        ),
      ],
    );
  }
}

class Flat extends StatelessWidget {
  const Flat({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonBar(
      alignment: MainAxisAlignment.start,
      children: [
        FlatButton(
          onPressed: () {},
          child: Text(
            "Flat button",
          ),
        ),
        FlatButton(
          onPressed: () {},
          color: Colors.blue,
          child: Text(
            "Flat button",
          ),
        ),
      ],
    );
  }
}

class Raised extends StatelessWidget {
  const Raised({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonBar(
      alignment: MainAxisAlignment.start,
      children: [
        RaisedButton(
          onPressed: () {},
          child: Text('Raised Button'),
        ),
        RaisedButton(
          onPressed: () {},
          color: Colors.blue[900],
          child: Text(
            'Raised Button',
            style: TextStyle(color: Colors.white),
          ),
        )
      ],
    );
  }
}
