import 'package:flutter/cupertino.dart';

class Description extends StatelessWidget {
   const Description({Key? key}) : super(key: key);
   @override
   Widget build(BuildContext context){
    return const Padding(padding: EdgeInsets.symmetric(vertical:10.0),
    child:
    Text(
        "Handmade Chocolate Cookies\nHand picked Ingredients\nBaked with Care\nNo Artificial Flavors\nPure Indulgence",
        style: TextStyle(height: 1.5, fontSize: 24),
      ),
    );
   }
}