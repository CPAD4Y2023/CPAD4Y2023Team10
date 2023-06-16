import 'package:choco_delicacies/widgets/product_description.dart';
import 'package:choco_delicacies/widgets/product_title_with_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'add_to_cart.dart';
import 'counter_with_fav_button.dart';

class ProductBody extends StatelessWidget {
  const ProductBody({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
              height: size.height,
              child: Stack(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: size.height * 0.3),
                    padding: EdgeInsets.only(
                      top: size.height * 0.1,
                      left: 20.0,
                      right: 20.0,
                    ),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      ),
                    ),
                    child: Column(
                      children: const [
                        Description(),
                        SizedBox(height: 8),
                        CounterWithFavBtn(),
                        SizedBox(height: 5),
                        AddToCart()
                      ],
                    ),
                  ),
                  const ProductTitleWithImage()
                ],
              ))
        ],
      ),
    );
  }
}
