import 'package:coffee/models/coffeeShop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../componant.dart';
import '../models/coffee.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  void addToCart(Coffee coffee){
    Provider.of<CoffeeShop>(context,listen: false).addToCart(coffee);
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShop>(
        builder: (context,coffeeshopprovider,child){
          return SafeArea(
            child: SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    margin: const EdgeInsets.all(8),
                    child: const Text("How Would you like your coffee?",
                      style: TextStyle(
                        color: Color.fromRGBO(
                            94, 92, 92, 1),
                        fontWeight: FontWeight.w900,
                        fontSize: 26
                    ),),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height/5,
                    width: double.infinity,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context,index)=>coffeeTile(
                          coffee: coffeeshopprovider.AllCoffees[index], tileButton:()=> addToCart(coffeeshopprovider.AllCoffees[index]),
                        ),
                        separatorBuilder: (context,index)=>const SizedBox(height: 18,),
                        itemCount:coffeeshopprovider.AllCoffees.length ),
                  ),
                   Container(height: 1,color: Colors.grey[300],),
                  const SizedBox(height: 16,),
                  Expanded(
                    child: ListView.separated(
                        itemBuilder: (context,index)=>coffeeTile(
                          coffee: coffeeshopprovider.AllCoffees[index], tileButton:()=> addToCart(coffeeshopprovider.AllCoffees[index]),
                        ),
                        separatorBuilder: (context,index)=>const SizedBox(height: 18,),
                        itemCount:coffeeshopprovider.AllCoffees.length ),
                  ),

                ],
              ),
            ),
          );
        });
  }
}
