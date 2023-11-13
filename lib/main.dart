import 'package:coffee/entry_page.dart';
import 'package:coffee/models/coffeeShop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (BuildContext context) {
      return CoffeeShop();
    },
      builder: (context,child)=>MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(

          primarySwatch: Colors.brown,

        ),
        home: const EntryPage(),
      ),
    );
  }
}

/*   List imgages = [
    "assets/coffee/coffee1.png",
    "assets/coffee/coffee2.png",
    "assets/coffee/coffee3.png",
    "assets/coffee/coffee4.png",
    "assets/coffee/coffee5.png",
    "assets/coffee/coffee6.png",
    "assets/coffee/coffee7.png",
  ];
  */
