import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FluentApp(
      title: 'Flutter Demo',
      theme: FluentThemeData(),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedView = 0;
  bool addSomeItems = false;

  @override
  Widget build(BuildContext context) {
    return NavigationView(
      pane: NavigationPane(selected: selectedView, items: [
        PaneItem(
          body: Text("Hello home"),
          icon: const Icon(Icons.home),
          title: const Text('Home'),
        ),
        PaneItem(
          body: Text("Hello settings"),
          icon: const Icon(Icons.settings),
          title: const Text('Settings'),
        ),
        if (addSomeItems)
          PaneItem(icon: Icon(FluentIcons.add), body: Text("I am here too !"))
      ], footerItems: [
        PaneItemExpander(
            icon: Icon(FluentIcons.filter),
            items: [PaneItemHeader(header: Text("Hello there"))],
            body: Text("Hello there")),
        PaneItem(
          icon: Icon(FluentIcons.add),
          body: Text("Add something cool"),
          onTap: () {
            setState(() {
              addSomeItems = !addSomeItems;
            });
          },
        )
      ]),
    );
  }
}
