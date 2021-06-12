import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: DefaultTextStyle(
        style: TextStyle(fontSize: 100, color: Colors.red),
        child: CustomScrollView(
          //------SliverList------
          // slivers: [
          //   SliverList(
          //------SliverFixedExtentList------
          // slivers: [
          //   SliverFixedExtentList(
          //     itemExtent: 200,
          //     delegate: SliverChildListDelegate([
          slivers: [
            SliverPrototypeExtentList(
              prototypeItem: FlutterLogo(size: 48,),
              delegate: SliverChildListDelegate([
                FlutterLogo(),
                Text("組件的高度都會是 48"),
                FlutterLogo(
                  size: 200,
                ),
                FlutterLogo(),
              ]),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                return Container(
                  height: 50,
                  color: Colors.primaries[index % 18],
                );
              }, childCount: 8),
            ),
            SliverGrid(
              delegate: SliverChildBuilderDelegate((context, index) {
                return Container(
                  height: 50,
                  color: Colors.primaries[index % 18],
                );
              }, childCount: 8),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
            ),
            SliverFillViewport(delegate: SliverChildListDelegate([
              Container(color: Colors.red,),
              Container(color: Colors.blue,),
              Container(color: Colors.orange,),
            ])),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
