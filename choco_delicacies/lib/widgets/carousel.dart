import 'package:flutter/material.dart';

class SaleWidget extends StatelessWidget {
  const SaleWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context){
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 0.2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        gradient: const LinearGradient(
            colors: [
              Color.fromARGB(255, 88, 38, 0),
              Color.fromARGB(129, 138, 90, 18),
            ],
            begin: FractionalOffset(0.0, 0.0),
            end: FractionalOffset(1.0, 0.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp),
      ),
      child: Row(
        children: [
          Flexible(
            flex: 2,
            child: Padding(padding: const EdgeInsets.all(14.0),
            child: Container(
              height: double.infinity,
              decoration: BoxDecoration(
                 color: Color.fromARGB(255, 60, 35, 7),
                 borderRadius: BorderRadius.circular(18),
              ),
            child: Padding(padding: const EdgeInsets.all(8.0),
            child: Column(
              children: const [
                SizedBox(
                  height: 10,
                ),
                Text("You got Us!",style: TextStyle(color: Colors.white,
                fontSize: 20,
                
                ),),
                SizedBox(height: 20,),
                Flexible(child: SizedBox(
                  width: double.infinity,
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: 
                      Text("It's \nHandmade ",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            ),
            )
            ),
          ),
          Flexible(
            flex: 3,
            child:Padding(padding: const EdgeInsets.all(14.0),
            child: Image.asset(
              width: double.infinity,
              "assets/images/choco.png",
              fit:BoxFit.contain
            ),
            )
          ),
        ],
      ),
    );
  }
}