import 'package:coffee/componant.dart';
import 'package:coffee/pages/cart.dart';
import 'package:coffee/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
class HomeLayout extends StatefulWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int indexPage=0;
  
  void SelectedIndex(int index){
   setState(() {
     indexPage=index;
   }); 
  }
  List<Widget> pages=[
     HomePage(),
      CartPage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   leading: Builder(
      //     builder: (BuildContext context) {
      //       return IconButton( onPressed: () {
      //         Scaffold.of(context).openDrawer();
      //       }, icon: Icon(Icons.menu,color: Colors.brown,),);
      //     },
      //
      //   ),
      // ),
      // drawer: Drawer(
      //   backgroundColor: Colors.brown.shade100,
      //   child: Column(
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //       DrawerHeader(child:
      //       ListTile(
      //         leading: IconButton( onPressed: () {
      //           // Scaffold.of(context).openDrawer();
      //         }, icon: Icon(Icons.home,color: Colors.brown,),),
      //         title:  Text("HOME", style: TextStyle(
      //             color: const Color.fromRGBO(102, 42, 19, 0.8),
      //             fontWeight: FontWeight.w900,
      //             fontFamily: "OpenSans",
      //             fontSize: 18
      //         ),),
      //       ),
      //
      //
      //       ),
      //       ListTile(
      //         leading: IconButton( onPressed: () {
      //           // Scaffold.of(context).openDrawer();
      //         }, icon: Icon(Icons.coffee,color: Colors.brown,),),
      //         title:  Text("Coffee", style: TextStyle(
      //             color: const Color.fromRGBO(102, 42, 19, 0.8),
      //             fontWeight: FontWeight.w900,
      //             fontFamily: "OpenSans",
      //             fontSize: 18
      //         ),),
      //       ),
      //       ListTile(
      //         leading: IconButton( onPressed: () {
      //           // Scaffold.of(context).openDrawer();
      //         }, icon: Icon(Icons.coffee,color: Colors.brown,),),
      //         title:  Text("Coffee", style: TextStyle(
      //             color: const Color.fromRGBO(102, 42, 19, 0.8),
      //             fontWeight: FontWeight.w900,
      //             fontFamily: "OpenSans",
      //             fontSize: 18
      //         ),),
      //       ),
      //
      //     ],
      //   ),
      // ),
      body: pages[indexPage],
      bottomNavigationBar:MyButtomNavBar(onTapChange: (index )=>SelectedIndex(index),)
    );
  }
}
