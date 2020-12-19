import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class TextFieldExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TextField'),
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
  String allText = "";
  String email = "Escrible el email";
  String password = "Escrible tu contraseña";
  String changed = "Se actualiza al pulsar una letra";
  TextEditingController _controlEmail = TextEditingController();
  TextEditingController _controlPassword = TextEditingController();
  TextEditingController _controlChange = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        //-------------Email------------------------
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: TextField(
            controller: _controlEmail,
            obscureText: false,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                labelText: 'Email',
                icon: Icon(Icons.forward_to_inbox_outlined)),
            onSubmitted: (text) {
              setState(() {
                email = text;
              });
            },
          ),
        ),
        //-----------------------------
        Center(
          child: Text(email),
        ),

        //-------------Password------------------------
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: TextField(
            controller: _controlPassword,
            obscureText: true,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                labelText: 'Password',
                icon: Icon(Icons.lock)),
            onSubmitted: (text) {
              setState(() {
                password = text;
              });
            },
          ),
        ),
        //-----------------------------
        Center(
          child: Text(password),
        ),

        Padding(
          padding: const EdgeInsets.all(15.0),
          child: TextField(
            controller: _controlChange,
            textInputAction: TextInputAction.done,
            style: TextStyle(
              color: Colors.red,
            ),
            obscureText: false,
            onChanged: (text) {
              setState(() {
                changed = text;
              });
            },
            decoration: InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'changed',
            ),
            onSubmitted: (text) {
              setState(() {
                changed = text;
              });
            },
          ),
        ),
        //-----------------------------
        Center(
          child: Text(changed),
        ),

        Container(
          margin: EdgeInsets.all(20),
          child: RaisedButton(
            child: Text('Enviar'),
            color: Colors.blue,
            onPressed: () {
              setState(() {
                allText =
                    'Email: ${_controlEmail.text}\nPassword: ${_controlPassword.text}\nChanged: ${_controlChange.text}';
              });
            },
          ),
        ),

        Container(
          child: Center(
            child: Text(allText),
          ),
        )
      ],
    );
  }
}
