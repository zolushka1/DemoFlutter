import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});
  static const routeName = "/list";

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  List<String> fruits = [
    'apple',
    'banana',
    'orange',
    'kiwi',
    "asd",
    "asdasd",
    "anand",
    "baynaa"
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          return true;
          // Navigator.pop(context);
        },
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Лист"),
            backgroundColor: Colors.red,
            actions: [],
          ),
          body: SafeArea(
            child: Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: ResponsiveGridList(
                        horizontalGridSpacing: 16, // Horizontal space between grid items
                        verticalGridSpacing: 16, // Vertical space between grid items
                        horizontalGridMargin: 50, // Horizontal space around the grid
                        verticalGridMargin: 50, // Vertical space around the grid
                        minItemWidth: 300, // The minimum item width (can be smaller, if the layout constraints are smaller)
                        minItemsPerRow: 2, // The minimum items to show in a single row. Takes precedence over minItemWidth
                        maxItemsPerRow: 5, // The maximum items to show in a single row. Can be useful on large screens
                        listViewBuilderOptions: ListViewBuilderOptions(),
                        children: List.generate(
                          4,
                          (index) => ColoredBox(
                            color: Colors.lightBlue,
                            child: Padding(
                              padding: const EdgeInsets.all(32),
                              child: Text(
                                fruits[index].toString(),
                                textAlign: TextAlign.center,
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
