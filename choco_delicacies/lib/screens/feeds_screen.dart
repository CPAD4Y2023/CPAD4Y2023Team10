import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/feed_widget.dart';

class FeedsScreen extends StatelessWidget{
  const FeedsScreen({Key? key}) : super(key: key);
   @override
   Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        // elevation: 4,
        title: const Text('All Products'),
      ),
      body:
      SingleChildScrollView(
        child:Column(children: [
          GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: 7,
                            gridDelegate:
                                const SliverGridDelegateWithMaxCrossAxisExtent(
                                    maxCrossAxisExtent: 190,
                                    crossAxisSpacing: 11,
                                    mainAxisSpacing: 11,
                                    childAspectRatio: 0.75),
                            itemBuilder: (ctx, index) {
                              return const FeedsWidget();
                            })
        ],)
      ),
      
    );
   }
}
