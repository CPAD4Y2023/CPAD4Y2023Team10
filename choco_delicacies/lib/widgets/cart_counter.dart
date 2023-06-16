import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartCounter extends StatefulWidget {
  const CartCounter({Key? key}) : super(key: key);
  @override
  CartCounterState createState() => CartCounterState();
}

class CartCounterState extends State<CartCounter> {
  int numOfItems = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        SizedBox(
          width: 40,
          height: 32,
          child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(13),
                ),
              ),
              child: const Icon(Icons.remove),
              onPressed: () {
                if (numOfItems > 1) {
                  setState(() {
                    numOfItems--;
                  });
                }
              }),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0 / 2),
          child: Text(
            // if our item is less  then 10 then  it shows 01 02 like that
            numOfItems.toString().padLeft(2, "0"),
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        SizedBox(
          width: 40,
          height: 32,
          child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(13),
                ),
              ),
              child: const Icon(Icons.add),
              onPressed: () {
                setState(() {
                  numOfItems++;
                });
              }),
        ),
      ],
    );
  }
}