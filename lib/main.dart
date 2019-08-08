import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'CounterModel.dart';

void main() {
  runApp(ChangeNotifierProvider(
    builder: (context) => CounterModel(),
    child: MyHomePage(),
  ));
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "FLutter Provider Ex",
      home: MyApp(),
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter Provider Ex"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Button Tapped for this many times..."),
          CounterValue(),
          CounterValueName(),
        ],
      ),
      floatingActionButton: MyFAB(),
    );
  }
}

class MyFAB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Provider.of<CounterModel>(context, listen: false).increment;
      },
      tooltip: "Increment Counter",
      child: Icon(Icons.plus_one),
    );
  }
}

class CounterValue extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      padding: EdgeInsets.all(10.0),
      child: Consumer<CounterModel>(
        builder: (context, counter, child) => Text(
          "${counter.count}",
          style: Theme.of(context).textTheme.display1,
        ),
      ),
    ));
  }
}

class CounterValueName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            padding: EdgeInsets.all(10.0),
            child: Consumer<CounterModel>(
                builder: (context, counter, child) =>
                    Text("${counter.getCounterModel()}"))));
  }
}
