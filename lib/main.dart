import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_learning/Page2.dart';
import 'package:provider_learning/providers/Counter.dart';
import 'package:provider_learning/providers/Theme.dart';

void main() {
  runApp(
    ///Single [Provider]
    // ChangeNotifierProvider(
    //   create: (context) => Counter(),
    //   child: MyApp(),
    // ),
    ///Multiple [Providers]
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Counter()),
        ChangeNotifierProvider(create: (_) => MyTheme()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<MyTheme>(
      builder: (context, theme, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        darkTheme: ThemeData.dark(),
        themeMode: theme.isDark ? ThemeMode.dark : ThemeMode.light,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Demo Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('You have pushed the button this many times:'),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => Page2()));
              },
              child: Text('Page 2'),
            ),
            Consumer<Counter>(
              builder: (context, counter, child) => Text(
                '${counter.value}',
                style: Theme.of(context).textTheme.headline2,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          var counter = context.read<Counter>();
          counter.increment();
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
