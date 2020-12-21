import 'package:flutter/material.dart';

class AnimationExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animaciones'),
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

class _BodyState extends State<Body> with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);
    animation = Tween<double>(begin: 0, end: 200).animate(controller)
      ..addListener(() {
        setState(() {
          animation = Tween<double>(begin: 0, end: 200).animate(controller);
        });
      });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Container(
        child: Center(
          child: Icon(
            Icons.flight_outlined,
            size: animation.value,
          ),
        ),
      ),
      Money(),
      Boton(),
    ]);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class Boton extends StatefulWidget {
  const Boton({
    Key key,
  }) : super(key: key);

  @override
  _BotonState createState() => _BotonState();
}

class _BotonState extends State<Boton> with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;
  String estadoText = "";

  ini() {
    bool stats = false;
    controller = AnimationController(
        duration: const Duration(milliseconds: 200), vsync: this);
    animation = Tween<double>(begin: 0, end: 20).animate(controller);
    animation.addListener(() {
      setState(() {
        animation = Tween<double>(begin: 0, end: 20).animate(controller);
      });
    });
    animation.addStatusListener((status) async {
      setState(() {
        estadoText = "$status  ${status.index}";
      });
      if (status.index == 3) {
        stats = true;
      } else {}
    });
    if (!stats) {
      controller.forward();
    } else {
      controller.reset();
    }
  }

  @override
  Widget build(BuildContext context) {
    dynamic estado;

    if (animation != null) {
      estado = animation.value;
    } else {
      estado = 10.0;
      estadoText = "Parado";
    }

    return Container(
      child: Column(
        children: [
          Center(
            child: RaisedButton(
              child: Text(
                'Haz click',
                style: TextStyle(fontSize: estado),
              ),
              onPressed: () {
                setState(() {
                  ini();
                });
              },
            ),
          ),
          Center(
            child: Text(estadoText),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class Money extends StatefulWidget {
  const Money({
    Key key,
  }) : super(key: key);

  @override
  _MoneyState createState() => _MoneyState();
}

class _MoneyState extends State<Money> with SingleTickerProviderStateMixin {
  Animation<Color> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: Duration(seconds: 2), vsync: this);
    animation =
        ColorTween(begin: Colors.green, end: Colors.red).animate(controller)
          ..addListener(() {
            setState(() {
              ColorTween(begin: Colors.green, end: Colors.red)
                  .animate(controller);
            });
          });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Icon(
          Icons.monetization_on,
          size: 100,
          color: animation.value,
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
