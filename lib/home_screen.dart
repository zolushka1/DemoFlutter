import 'package:demo/Screens/list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const routeName = "/home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Үндсэн цэс"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              ElevatedButton(
                onPressed: () async {
                  await Navigator.pushNamed(context, ListScreen.routeName);
                },
                child: Text("List"),
              ),
              Divider(),
              ElevatedButton(onPressed: null, child: Text("Button")),
              Divider(),
              ElevatedButton(onPressed: null, child: Text("Image")),
              Divider(),
              ElevatedButton(onPressed: null, child: Text("Grid")),
            ],
          ),
        ));
  }
}
