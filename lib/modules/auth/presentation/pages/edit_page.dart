import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../components/buttons/loading_button.dart';
import '../controllers/user_controller.dart';
import '../widgets/text_fileds/email_field.dart';
import '../widgets/text_fileds/name_field.dart';

class UserEditPage extends StatelessWidget {
  final UserController userController = Get.find<UserController>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  UserEditPage({super.key}) {
    nameController.text = userController.user?.name ?? '';
    emailController.text = userController.user?.email ?? '';
  }

  Future<void> _updateUserProfile() async {
    if (_formKey.currentState!.validate()) {
      try {
        await userController.updateUserProfile(
          nameController.text.trim(),
          emailController.text.trim(),
        );
        Get.back();
      } catch (e) {
        Get.snackbar("Error", "Failed to update profile: ${e.toString()}");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit User Information')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              NameField(controller: nameController),
              const SizedBox(height: 15),
              EmailField(controller: emailController),
              const SizedBox(height: 20),
              UpdateButton(onPressed: _updateUserProfile),
            ],
          ),
        ),
      ),
    );
  }
}

class UpdateButton extends StatelessWidget {
  final Future<void> Function() onPressed;

  const UpdateButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return LoadingButton(
      text: 'Update',
      onPressed: onPressed,
      color: Colors.blue,
      textColor: Colors.white,
    );
  }
}
