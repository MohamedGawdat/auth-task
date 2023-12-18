import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../share_profile/presentation/pages/share_profile_page.dart';
import 'edit_page.dart';
import '../controllers/user_controller.dart';

class UserInfoPage extends StatelessWidget {
  const UserInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final UserController userController = Get.find<UserController>();

    return Obx(() {
      final user = userController.user;
      if (user != null) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Home'),
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () => Get.to(() => UserEditPage()),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.share),
            onPressed: () => Get.to(() => ShareProfilePage(user: user)),
          ),
          body: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Name: ${user.name ?? 'N/A'}'),
              Text('Email: ${user.email ?? 'N/A'}'),
            ],
          )),
        );
      } else {
        return const Text('No user is currently signed in.');
      }
    });
  }
}
