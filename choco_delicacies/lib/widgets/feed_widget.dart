import 'package:choco_delicacies/widgets/product_details.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '../consts/global_colors.dart';
import '../models/products_model.dart';
import '../screens/details_screen.dart';

class FeedsWidget extends StatelessWidget {
  const FeedsWidget({Key? key, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productsModelProvider = Provider.of<ProductsModel>(context);
    
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Material(
        borderRadius: BorderRadius.circular(8.0),
        color: Theme.of(context).cardColor,
        child: InkWell(
          borderRadius: BorderRadius.circular(8.0),
          onTap: () {
            Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.fade,
                // child: ProductDetails(id: productsModelProvider.productId.toString(),),
                child:  DetailsScreen(id:productsModelProvider.productId.toString()),
              ),
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 5, right: 5, top: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: RichText(
                        text: TextSpan(
                            text: 'RS',
                            style: const TextStyle(
                                color: Color.fromRGBO(0, 0, 1, 1)),
                            children: <TextSpan>[
                              TextSpan(
                                  // text: "${productsModelProvider.price}",
                                  text:"${productsModelProvider.price}",
                                  style: TextStyle(
                                      color: lightTextColor,
                                      fontWeight: FontWeight.w600)),
                            ]),
                      ),
                    ),
                    const Icon(IconlyBold.heart),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  height: size.height * 0.2,
                  productsModelProvider.productImageURL.toString(),
                  width: double.infinity,
                  fit: BoxFit.fill,

                )
                // child: FancyShimmerImage(
                //   height: size.height * 0.2,
                //   width: double.infinity,
                //   errorWidget: const Icon(
                //     IconlyBold.danger,
                //     color: Colors.red,
                //     size: 28,
                //   ),
                //   imageUrl: productsModelProvider.productImageURL.toString(),
                //   boxFit: BoxFit.fill,
                // ),
              ),
              const SizedBox(height: 5),
              Padding(
                padding:  const EdgeInsets.only(left: 2, right: 2, top: 3),
                child: Text(
                  productsModelProvider.productTitle.toString(),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style:const TextStyle(
                    fontSize: 16,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
            ),
        ),
      ),
    );
  }
}