import 'package:choco_delicacies/consts/global_colors.dart';
import 'package:choco_delicacies/widgets/category_widget.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Categories", style: TextStyle(color:Color.fromARGB(255, 57, 39, 1)),)),
        // body: FutureBuilder<List<CategoriesModel>>(
        //     future: APIHandler.getAllCategories(),
        //     builder: ((context, snapshot) {
        //       if (snapshot.connectionState == ConnectionState.waiting) {
        //         return const Center(
        //           child: CircularProgressIndicator(),
        //         );
        //       } else if (snapshot.hasError) {
        //         Center(
        //           child: Text("An error occured ${snapshot.error}"),
        //         );
        //       } else if (snapshot.data == null) {
        //         const Center(
        //           child: Text("No products has been added yet"),
        //         );
        //       }
        body: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 2,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 190,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 0.95),
            itemBuilder: (ctx, index) {
              // return ChangeNotifierProvider.value(
              //     value: snapshot.data![index],
              //     child: const CategoryWidget());
              return const CategoryWidget();
            }));
    // })));
  }
}
