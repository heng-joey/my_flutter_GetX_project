import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
//import 'counter_app/counter_page.dart';
import 'crud_local_storage/local_storage_page.dart';

void main() async{
  await GetStorage.init();
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
      home: LocalStoragePage(),
    );
  }
}
