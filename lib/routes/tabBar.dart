import 'package:flutter/material.dart';

class TabBarExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(splashColor: Colors.transparent),
      title: 'TabBar',
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
            appBar: AppBar(
              title: Text('Tab Bar'),
              leading: IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {},
              ),
              bottom: TabBar(
                unselectedLabelColor: Colors.blue[900],
                onTap: (i) {
                  print(i);
                },
                indicator: TabBarTheme.of(context).indicator,
                indicatorColor: Colors.black,
                indicatorWeight: 2,
                labelColor: Colors.white,
                labelStyle: TextStyle(),
                tabs: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Icono'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Boton'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Imagen'),
                  ),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                Center(
                  child: Icon(Icons.monetization_on),
                ),
                Center(
                  child: RaisedButton(
                    onPressed: () {},
                    child: Text('All Ok'),
                  ),
                ),
                Center(
                  child: Image(
                    image: AssetImage('assets/img1.jpg'),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
