import 'package:flutter/material.dart';

class AnimatedContainerExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Container'),
      ),
      body: Body(),
      floatingActionButton: AbrirDetalles(),
    );
  }
}

class AbrirDetalles extends StatefulWidget {
  const AbrirDetalles({
    Key key,
  }) : super(key: key);

  @override
  _AbrirDetallesState createState() => _AbrirDetallesState();
}

class _AbrirDetallesState extends State<AbrirDetalles> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return Foto();
        }));
      },
      child: Icon(Icons.add),
    );
  }
}

class Foto extends StatefulWidget {
  const Foto({
    Key key,
  }) : super(key: key);

  @override
  _FotoState createState() => _FotoState();
}

class _FotoState extends State<Foto> {
  var alineacion = Alignment.bottomCenter;
  @override
  void initState() {
    super.initState();
    ini();
  }

  ini() async {
    await Future.delayed(Duration(milliseconds: 300));
    setState(() {
      alineacion = Alignment.topCenter;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Hero(
        tag: 'foto',
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            child: AnimatedContainer(
                alignment: alineacion,
                duration: Duration(seconds: 2),
                child: Image.asset('assets/img1.jpg')),
          ),
        ),
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
  double valorSlider = 50.0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AnimatedContainer(
            child: Image(
              image: AssetImage('./assets/img1.jpg'),
            ),
            height: valorSlider,
            width: valorSlider,
            duration: Duration(seconds: 2),
            curve: Curves.ease,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Slider(
              value: valorSlider,
              onChanged: (value) {
                setState(() {
                  valorSlider = value;
                });
              },
              min: 0,
              max: 200,
              divisions: 200,
            ),
          ),
          AnimatedContainer(
            duration: Duration(seconds: 3),
            height: 100,
            color: Color.fromARGB(valorSlider.toInt(), 0, 0, 0),
          )
        ],
      ),
    );
  }
}
