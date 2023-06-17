import 'dart:developer';

import 'package:choco_delicacies/models/products_model.dart';
import 'package:choco_delicacies/widgets/product_description.dart';
import 'package:choco_delicacies/widgets/product_details.dart';
import 'package:choco_delicacies/widgets/product_title_with_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../services/api_handler.dart';
import 'add_to_cart.dart';
import 'counter_with_fav_button.dart';

class ProductBody extends StatefulWidget {
  const ProductBody({
    Key? key, required this.id,
  }) : super(key: key);
    final String id;
  @override
  State<ProductBody> createState() => _ProductBodyState();
}

class _ProductBodyState extends State<ProductBody> {
 ProductsModel? productsModel;
 bool isError = false;
  String errorStr = "";
Future<void> getProductInfo() async {
    try {
      productsModel = await APIHandler.getProductById(id: widget.id);
    } catch (error) {
      isError = true;
      errorStr = error.toString();
      log("error $error");
    }
    setState(() {});
  }

  @override
  void didChangeDependencies() {
    getProductInfo();
    super.didChangeDependencies();
  }

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
                      children: [
                        Description(id: widget.id),
                        const SizedBox(height: 8),
                        const CounterWithFavBtn(),
                        const SizedBox(height: 5),
                        const AddToCart()
                      ],
                    ),
                  ),
                   ProductTitleWithImage(product: productsModel)
                ],
              ))
        ],
      ),
    );
  }
}

