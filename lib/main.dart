import 'package:flutter/material.dart';
import 'package:list_multi/itemsmodel.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ChangeNotifierProvider(
          create: (_) => ItemsModel(),
          child: ContentList(),
        ),
      ),
    );
  }
}

class ContentList extends StatelessWidget {
  ContentList({
    Key? key,
  }) : super(key: key);

  final dataList = ["item 1", "item 2", "item 3"];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemBuilder: (context, i) {
          return ListTile(
            title: Text("${dataList[i]}"),
            onTap: () {
              context.read<ItemsModel>().selectItem(i);
            },
            tileColor: context.watch<ItemsModel>().items.contains(i) ? Colors.red : Colors.white ,
          );
        },
      ),
    );
  }
}
