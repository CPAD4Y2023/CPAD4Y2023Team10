import 'package:choco_delicacies/consts/global_colors.dart';
import 'package:choco_delicacies/models/categories_model.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final categoriesModelProvider = Provider.of<CategoriesModel>(context);
    
    Size size = MediaQuery.of(context).size;
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          color:lightBackgroundColor,
          child: Material(
            child: InkWell(
              onTap:(){},
              child: Stack(
          children: [
              Padding(padding:const EdgeInsets.all(6) , 
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
               child:Image.asset(
                height: size.height * 0.30,
                width: size.width * 0.45,
                categoriesModelProvider.productImageURL.toString(),
                fit: BoxFit.fill,
              ),
              ),
              
              // child: FancyShimmerImage(
              //   height: size.width * 0.45,
              //   width: size.width * 0.45,
              //   errorWidget: const Icon(
              //     IconlyBold.danger,
              //     color: Colors.red,
              //     size: 28,
              //   ),
              //   imageUrl: categoriesModelProvider.image.toString(),
              //   boxFit: BoxFit.fill,
              // ),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                categoriesModelProvider.categoryName.toString(),
                // categoriesModelProvider.name.toString(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  backgroundColor: lightCardColor.withOpacity(0.5),
                ),
              ),
            )
          ],
        ),
            )
        )
        ),
          );
          
           
    //  return Stack(
    //     children: [
    //       ClipRRect(
    //         borderRadius: BorderRadius.circular(12),
    //         child: Image.asset(
    //               height: size.height * 0.45,
    //               width:size.width * 0.45,
    //               "assets/images/choco.png",
    //               fit: BoxFit.fill,

    //             ),
    //         // child: FancyShimmerImage(
    //         //   height: size.width * 0.45,
    //         //   width: size.width * 0.45,
    //         //   errorWidget: const Icon(
    //         //     IconlyBold.danger,
    //         //     color: Colors.red,
    //         //     size: 28,
    //         //   ),
    //         //   imageUrl: categoriesModelProvider.image.toString(),
    //         //   boxFit: BoxFit.fill,
    //         // ),
    //       ),
    //       // Align(
    //       //   alignment: Alignment.center,
    //       //   child: Text(
    //       //     categoriesModelProvider.name.toString(),
    //       //     textAlign: TextAlign.center,
    //       //     style: TextStyle(
    //       //       fontSize: 24,
    //       //       fontWeight: FontWeight.bold,
    //       //       backgroundColor: lightCardColor.withOpacity(0.5),
    //       //     ),
    //       //   ),
    //       // )
    //     ],
    //   );
  }
}
