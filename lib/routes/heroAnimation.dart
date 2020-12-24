import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class HeroAnimationExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    timeDilation = 3.0;
    return Scaffold(
      appBar: AppBar(
        title: Text('Hero Animation'),
      ),
      body: Container(
        child: Imagen(Alignment.topLeft, 200, () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (BuildContext ctx) {
            return Scaffold(
              appBar: AppBar(
                title: Text('Zoom'),
              ),
              body: Container(
                child: Imagen(Alignment.center, 500.0, () {
                  Navigator.of(ctx).pop();
                }, 'assets/img1.jpg'),
              ),
            );
          }));
        }, 'assets/img1.jpg'),
      ),
    );
  }
}

class Imagen extends StatelessWidget {
  final double size;
  final alig;
  final onTap;
  final url;
  const Imagen(this.alig, this.size, this.onTap, this.url, {Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      child: Hero(
        tag: 'imag',
        child: Material(
          child: InkWell(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                url,
                fit: BoxFit.fill,
              ),
            ),
            onTap: onTap,
          ),
        ),
      ),
    );
  }
}
