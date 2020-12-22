import 'package:flutter/material.dart';

class AnimatedContainerExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Container'),
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
