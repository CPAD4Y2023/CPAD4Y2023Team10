import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../consts/global_colors.dart';

class UsersWidget extends StatelessWidget {
  const UsersWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // final usersModelProvider = Provider.of<UsersModel>(context);

    return Container(
        color: lightBackgroundColor,
        child: ListTile(
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: SizedBox(
              width: size.width * 0.15,
              height: size.width * 0.15,
              child: Image.asset(
                height: size.height * 0.15,
                width: size.width * 0.15,
                "assets/images/avatar.png",
                fit: BoxFit.contain,
              ),
            ),
          ),
          // leading: FancyShimmerImage(
          //   height: size.width * 0.15,
          //   width: size.width * 0.15,
          //   errorWidget: const Icon(
          //     IconlyBold.danger,
          //     color: Colors.red,
          //     size: 28,
          //   ),
          //   imageUrl: usersModelProvider.avatar.toString(),
          //   boxFit: BoxFit.fill,
          // ),
          // title: Text(usersModelProvider.name.toString()),
          title: const Text("User Name", style: TextStyle(fontSize: 28),),
          // subtitle: Text(usersModelProvider.email.toString()),
          subtitle: const Text("username@mail.com", style: TextStyle(fontSize: 18)),
          trailing: Text(
            // usersModelProvider.role.toString(),
            "User",
            style: TextStyle(
              color: lightIconsColor,
              fontWeight: FontWeight.bold,
              fontSize: 24
            ),
          ),
        ));
  }
}
