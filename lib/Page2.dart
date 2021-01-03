import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_learning/providers/Counter.dart';
import 'package:provider_learning/providers/Theme.dart';

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Counter>(
      builder: (context, counter, child) => Scaffold(
        floatingActionButton: Consumer<MyTheme>(
          builder: (context, theme, child) => FloatingActionButton(
            child: Text('Theme'),
            onPressed: () {
              theme.toogleTheme();
            },
          ),
        ),
        appBar: AppBar(
          title: Text('${counter.value}'),
        ),
        body: Center(
          child: Text('Page 2'),
        ),
      ),
    );
  }
}
