import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/products_model.dart';
import '../services/api_handler.dart';


class Description extends StatefulWidget {
  const Description({
    Key? key, required this.id,
  }) : super(key: key);
    final String id;
  @override
  State<Description> createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {

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
   Widget build(BuildContext context){
    return productsModel == null ?const Center(
                    child: CircularProgressIndicator(),
                  ) : Padding(padding:const EdgeInsets.symmetric(vertical:10.0),
    child:
    Text(
        productsModel!.productDescription.toString(),
        style: const TextStyle(height: 1.5, fontSize: 24),
      ),
    );
   }
}
