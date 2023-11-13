import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'models/coffee.dart';




class MyButtomNavBar extends StatelessWidget {
  void Function(int)? onTapChange;
  MyButtomNavBar({super.key,
    required this.onTapChange,
  });

  @override
  Widget build(BuildContext context) {
    return  GNav(
          onTabChange: (value)=>onTapChange!(value),
          mainAxisAlignment: MainAxisAlignment.center,
          activeColor: Colors.brown,
          tabMargin: const EdgeInsets.all(6),
          padding: const EdgeInsets.all(24),
          backgroundColor: const Color.fromRGBO(245, 245, 245, 0.8),
          color: const Color.fromRGBO(151, 128, 128, 0.8),
          tabBackgroundColor: const Color.fromRGBO(151, 128, 128, 0.1),
          gap: 15,
          tabs:const [
            GButton(icon: Icons.home,text: "Shop",),
            GButton(icon: Icons.shopping_cart,text: "Cart",),
          ]
    );
  }
}

class coffeeTile extends StatelessWidget {
  Coffee coffee;
  void Function() tileButton;
   bool isNotInCart=true;
   int coffeeQte=0;
  coffeeTile({super.key,required this.coffee,required this.tileButton, this.isNotInCart=true, this.coffeeQte=0});

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12)
      ),
      height: 140,
      padding: EdgeInsets.zero,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(bottom: 14,left: 16,right: 16),
      child:Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
              coffee.coffeeImageUrl,
            width: MediaQuery.of(context).size.width/5,
            height: MediaQuery.of(context).size.width/4,
          ),
          const SizedBox(width: 16,),
          SizedBox(
            width: MediaQuery.of(context).size.width/2.1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Drink Name : ${coffee.coffeeName}", style: const TextStyle(
                    color: Color.fromRGBO(94, 92, 92, 0.8),
                    fontWeight: FontWeight.w900,
                    fontSize: 18,

                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,),
                const SizedBox(height: 15,),
                Text("Drink Price : ${coffee.coffeePrice.toString()}" , style: const TextStyle(
                    color: Color.fromRGBO(94, 92, 92, 0.8),
                    fontWeight: FontWeight.w900,
                    fontSize: 16
                ),),
                const SizedBox(height: 15,),

                if(!isNotInCart) Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text("Qte", style: TextStyle(
                        color: Color.fromRGBO(94, 92, 92, 0.8),
                        fontWeight: FontWeight.w900,
                        fontSize: 16
                    ),),
                    const SizedBox(width: 8,),
                    Text(coffeeQte.toString(), style: const TextStyle(
                        color: Color.fromRGBO(94, 92, 92, 0.8),
                        fontWeight: FontWeight.w900,
                        fontSize: 16
                    ),),
                  ],
                ),
              ],
            ),
          ),
          const Spacer(),
          IconButton(onPressed: (){
            tileButton() ;
          }, icon: Icon(
            isNotInCart ? Icons.add : Icons.remove ,size: 40,)),
          const SizedBox(width: 22,),
        ],
      )

    );
  }
}


