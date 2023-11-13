import 'package:flutter/material.dart';

import 'Home.dart';

class EntryPage extends StatelessWidget {
  const EntryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
      padding: const EdgeInsets.all(12.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 400,
              width: 400,
              child: Image.asset("assets/coffee/coffee4.png",),
            ),
            const Text(
              "Brew Day",
              style: TextStyle(
                  color: Color.fromRGBO(102, 42, 19, 0.8),
                  fontWeight: FontWeight.w900,
                  fontFamily: "OpenSans",
                  fontSize: 24
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height/40,),
            const Text("How do you like your coffee?",
              style: TextStyle(
                  color: Color.fromRGBO(94, 92, 92, 0.8),
                  fontWeight: FontWeight.w900,
                  fontSize: 16
              ),),
             SizedBox(height: MediaQuery.of(context).size.height/24,),
            GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeLayout()));
                },
                child:
              Container(
                padding: EdgeInsets.zero,
                margin: EdgeInsets.zero,
                width: MediaQuery.of(context).size.width/1.2,
                height: MediaQuery.of(context).size.height/12,
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(106, 31, 2, 0.8),
                  borderRadius: BorderRadius.circular(12)
                ),
                child: const Center(child: Text(
                    "Enter Shop",
                    style: TextStyle(
                        fontFamily: "OpenSans",

                        color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 18
                    ),
                ),),
              )
            )
          ],
        ),
      ),
    )
 
    ); }
}
