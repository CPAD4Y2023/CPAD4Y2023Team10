import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../consts/global_colors.dart';
import '../widgets/product_body.dart';

class DetailsScreen extends StatelessWidget{
  const DetailsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: lightBackgroundColor,
      appBar: buildAppBar(context),
      body: const ProductBody(),
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