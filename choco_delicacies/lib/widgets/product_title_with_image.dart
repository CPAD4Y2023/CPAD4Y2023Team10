import 'package:flutter/material.dart';

import '../models/products_model.dart';

class ProductTitleWithImage extends StatelessWidget {
  const ProductTitleWithImage({Key? key, required this.product}) : super(key: key);
  final ProductsModel? product;
  @override
  Widget build(BuildContext context){
    Size size = MediaQuery.of(context).size;
    return product == null ? const Center(
                    child: CircularProgressIndicator(),
                  ): Padding(padding:  const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:<Widget> [
           Text(
            product!.productName.toString(),
            style:const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height:5),
          Text(
            product!.productTitle.toString(),
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 15.0),
          Row(children: <Widget>[
            RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(text: "Price\n"),
                     TextSpan(
                      text: "RS ",
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: product!.price.toString(),
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
             const SizedBox(width:20.0),
            SizedBox(
              height: size.height * 0.25,
              child: 
              Hero(
                tag:"1",
                
                child: ClipRRect(borderRadius:BorderRadius.circular(15),
                  child: 
                  Image.asset(
                  "assets/images/choco.png",
                  fit: BoxFit.contain,
                ),
                ),
                )

            ),
          ],)
        ]),
    );
  }
}