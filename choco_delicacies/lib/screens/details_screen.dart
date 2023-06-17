import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../consts/global_colors.dart';
import '../models/products_model.dart';
import '../services/api_handler.dart';
import '../widgets/product_body.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({
    Key? key,
    required this.id,
  }) : super(key: key);
  final String id;
  @override
  State<DetailsScreen> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<DetailsScreen> {

   final titleStyle = const TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
  ProductsModel? productsModel; 
   Future<void> getProductInfo() async {
    productsModel = await APIHandler.getProductById(id: widget.id);
     setState(() {});
   }

    @override
  void didChangeDependencies() {
    getProductInfo();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: lightBackgroundColor,
      appBar: buildAppBar(context),
      body: ProductBody(id: widget.id),
    );
  }

  AppBar buildAppBar(BuildContext context){
  return AppBar(
    backgroundColor: lightBackgroundColor,
    elevation: 0,
    leading:IconButton(
        icon: SvgPicture.asset(
          'assets/icons/back.svg',
          color: Colors.white,
        ),
        onPressed: () => Navigator.pop(context),
      ),
      actions:<Widget> [
        IconButton(
           icon: SvgPicture.asset("assets/icons/search.svg"),
          onPressed: () {},
          ),
        IconButton(
           icon: SvgPicture.asset("assets/icons/cart.svg"),
          onPressed: () {},
          ),
         const SizedBox(width: 20.0 / 2)
      ],
  );
  

}
}