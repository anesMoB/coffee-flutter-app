import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../componant.dart';
import '../models/coffee.dart';
import '../models/coffeeShop.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  void removeFromCart(Coffee coffee){
    Provider.of<CoffeeShop>(context,listen: false).removeFromCart(coffee);
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShop>(
        builder: (context,coffeeshopprovider,child){
          return SafeArea(
            child: Container(
              height: double.infinity,
              width: double.infinity,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(8),
                    margin: EdgeInsets.all(8),
                    child: const Text("How Would you like your coffee?",
                      style: TextStyle(
                          color: Color.fromRGBO(
                              94, 92, 92, 1),
                          fontWeight: FontWeight.w900,
                          fontSize: 26
                      ),),
                  ),
                  Expanded(
                    child:coffeeshopprovider.AllCoffeesInCart.isEmpty ? const Center(child: Text("Your cart is Empty!",
                      style: TextStyle(
                          color: Color.fromRGBO(
                              94, 92, 92, 0.4),
                          fontWeight: FontWeight.w900,
                          fontSize: 26
                      ),),):
                     ListView.separated(
                        itemBuilder: (context,index){
                         return coffeeTile(
                             coffee: coffeeshopprovider.AllCoffeesInCartList[index],
                           tileButton:()=> removeFromCart(coffeeshopprovider.AllCoffeesInCartList[index],),
                           isNotInCart: false,
                           coffeeQte: coffeeshopprovider.coffeesInCart[coffeeshopprovider.AllCoffeesInCartList[index]] as int,
                           );

                         },
                        separatorBuilder: (context,index)=> SizedBox(height: 18,),
                        itemCount:coffeeshopprovider.AllCoffeesInCart.length ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    margin:const EdgeInsets.all(8),
                    child: Text("Totale price = ${coffeeshopprovider.getTotalPrice}",
                      style: const TextStyle(
                          color: Color.fromRGBO(
                              94, 92, 92, 1),
                          fontWeight: FontWeight.w900,
                          fontSize: 22
                      ),),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
