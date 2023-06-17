import 'package:card_swiper/card_swiper.dart';
import 'package:choco_delicacies/consts/global_colors.dart';
import 'package:choco_delicacies/screens/categories_screen.dart';
import 'package:choco_delicacies/screens/user_screen.dart';
import 'package:choco_delicacies/services/api_handler.dart';
import 'package:choco_delicacies/widgets/appbar_icons.dart';
import 'package:choco_delicacies/widgets/feeds_grid.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:page_transition/page_transition.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';

import '../models/products_model.dart';
import '../widgets/carousel.dart';
import '../widgets/feed_widget.dart';
import 'feeds_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController _textEditingController;
  List<ProductsModel> productsList = [];
  @override
  void initState() {
    _textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  // @override
  // void didChangeDependencies() {
  //   getProducts();
  //   super.didChangeDependencies();
  // }

  // Future<void> getProducts() async{
  //   productsList = await APIHandler.getAllProducts();
  //   setState(() {
      
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
          appBar: AppBar(
            elevation: 4,
            title: const Text('Home'),
            leading: AppBarIcons(
              function: () {
                Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.fade,
                    child: const CategoryScreen(),
                  ),
                );
              },
              icon: CupertinoIcons.cart,
            ),
            actions: [
              AppBarIcons(
                function: () {
                  Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.fade,
                    child: const UsersScreen(),
                  ),
                );
                },
                icon: CupertinoIcons.gear,
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 18,
                ),
                TextField(
                  controller: _textEditingController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      hintText: "Search",
                      filled: true,
                      fillColor: Theme.of(context).cardColor,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: Theme.of(context).cardColor,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                            width: 1,
                            color: Theme.of(context).colorScheme.secondary),
                      ),
                      suffixIcon: Icon(
                        CupertinoIcons.search,
                        color: lightIconsColor,
                      )),
                ),
                const SizedBox(
                  height: 5,
                ),
                Expanded(
                    child: SingleChildScrollView(
                        child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: size.height * 0.2,
                      child: Swiper(
                        itemCount: 3,
                        itemBuilder: (ctx, index) {
                          return const SaleWidget();
                        },
                        autoplay: true,
                        pagination: const SwiperPagination(
                            alignment: Alignment.bottomCenter,
                            builder: DotSwiperPaginationBuilder(
                                color: Colors.white,
                                activeColor: Color.fromARGB(255, 28, 13, 1))),
                        // control: const SwiperControl()
                      ),
                    ),
                    const SizedBox(height: 5),
                     Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            const Text(
                              "Latest Products",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                              ),
                            ),
                            const Spacer(),
                            AppBarIcons(
                                function: () {
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          type: PageTransitionType.fade,
                                          child: const FeedsScreen()));
                                },
                                icon: IconlyBold.arrowRight2),
                          ],
                        ),
                      ),
                    // productsList.isEmpty? Container() : FeedsGridWidget(productsList: productsList),
                     FutureBuilder<List<ProductsModel>>(
                          future: APIHandler.getAllProducts(),
                          builder: ((context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else if (snapshot.hasError) {
                              Center(
                                child:
                                    Text("An error occured ${snapshot.error}"),
                              );
                            } else if (snapshot.data == null) {
                              const Center(
                                child: Text("No products has been added yet"),
                              );
                            }
                            return FeedsGridWidget(
                                productsList: snapshot.data!);
                          }))
                  ],
                ))),
                // Flexible(
                //   child: Column(children: [
                //     SizedBox(
                //       width: double.infinity,
                //       height: size.height * 0.2,
                //       child: Swiper(
                //         itemCount: 3,
                //         itemBuilder: (ctx, index) {
                //           return const SaleWidget();
                //         },
                //         autoplay: true,
                //         pagination: const SwiperPagination(
                //             alignment: Alignment.bottomCenter,
                //             builder: DotSwiperPaginationBuilder(
                //                 color: Colors.white,
                //                 activeColor: Color.fromARGB(255, 28, 13, 1))),
                //         // control: const SwiperControl()
                //       ),
                //     ),
                //     const SizedBox(height: 5),
                //     Expanded(
                //         child: GridView.builder(
                //             shrinkWrap: true,
                //             // physics: const NeverScrollableScrollPhysics(),
                //             itemCount: 10,
                //             gridDelegate:
                //                 const SliverGridDelegateWithMaxCrossAxisExtent(
                //                     maxCrossAxisExtent: 180,
                //                     crossAxisSpacing: 11,
                //                     mainAxisSpacing: 11,
                //                     childAspectRatio: 0.75),
                //             itemBuilder: (ctx, index) {
                //               return const FeedsWidget();
                //             })),
                //   ]),
                // ),
              ],
            ),
          )),
    );
  }
}
