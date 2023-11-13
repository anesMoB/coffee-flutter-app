

import 'package:coffee/models/coffee.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class CoffeeShop extends ChangeNotifier{

  List<Coffee> coffees=[
    Coffee(coffeeName: "Coffee Coffee Coffee 1", coffeePrice: 30.0, coffeeImageUrl: "assets/coffee/coffee1.png"),
    Coffee(coffeeName: "Coffee 2", coffeePrice: 50.0, coffeeImageUrl: "assets/coffee/coffee2.png"),
    Coffee(coffeeName: "Coffee 3", coffeePrice: 40.0, coffeeImageUrl: "assets/coffee/coffee3.png"),
    Coffee(coffeeName: "Tea 1", coffeePrice: 20.0, coffeeImageUrl: "assets/coffee/tea1.png"),
    Coffee(coffeeName: "Tea 2", coffeePrice: 25.0, coffeeImageUrl: "assets/coffee/tea2.png"),
    Coffee(coffeeName: "Tea ", coffeePrice: 25.0, coffeeImageUrl: "assets/coffee/tea.png"),
  ];
  Map<Coffee,int> coffeesInCart={};
  List<Coffee> coffeesInCartList=[];

  List<Coffee> get AllCoffees => coffees;
  Map<Coffee,int> get AllCoffeesInCart  => coffeesInCart;
  List<Coffee> get AllCoffeesInCartList  => coffeesInCart.keys.toList();

  double totalePrice=0.0;
  double  get getTotalPrice=> totalePrice;
   void getTotale  (bool isAdding,double price){
      isAdding ? totalePrice= totalePrice + price :
      totalePrice= totalePrice - price;
  }
  void addToCart(Coffee coffee){

    if(coffeesInCart.containsKey(coffee)){
      coffeesInCart.update(coffee, (value) => (coffeesInCart[coffee]! + 1));
    }else{
      coffeesInCart[coffee]=1;
    }
    if (kDebugMode) {
      print("coffeesInCart[coffee] : ${coffee.coffeeName}  = ${coffeesInCart[coffee]}");
    }
    getTotale(true, coffee.coffeePrice);
    notifyListeners();
  }
  void removeFromCart(Coffee coffee){
    if(coffeesInCart.containsKey(coffee) && coffeesInCart[coffee]! > 1){
      coffeesInCart.update(coffee, (value) => (coffeesInCart[coffee]! -1));
    }else{
      coffeesInCart.remove(coffee);
    }
    if (kDebugMode) {
      print("coffeesInCart[coffee] : ${coffee.coffeeName}  = ${coffeesInCart[coffee]}");
    }
    getTotale(false, coffee.coffeePrice);
    notifyListeners();
  }
  int getCoffeeQte(Coffee coffee){
    if(coffeesInCart.containsKey(coffee) ){
      return coffeesInCart[coffee]! ;
    }
    return 0;

  }

}