import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_management_task/config/ui/text_style/app_text_style.dart';
import '../../../auth/domain/entities/user_entity.dart';
import '../controller/share_controller.dart';

class ShareProfilePage extends StatelessWidget {
  final UserEntity user;

  const ShareProfilePage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final ShareProfileController controller = Get.find<ShareProfileController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Share Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Name: ${user.name ?? 'N/A'}'),
            Text('Email: ${user.email ?? 'N/A'}'),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: () => controller.shareUserProfile(user), child: const Text('Share Profile', style: AppTextStyle.headingStyle2)),
          ],
        ),
      ),
    );
  }
}
