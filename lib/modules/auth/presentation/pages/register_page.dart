import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_management_task/config/ui/colors/app_colors.dart';
import '../../../../components/buttons/loading_button.dart';
import '../../../../config/ui/text_style/app_text_style.dart';
import '../controllers/register_controller.dart';
import '../widgets/text_fileds/email_field.dart';
import '../widgets/text_fileds/name_field.dart';
import '../widgets/text_fileds/password_field.dart';

class RegisterPage extends StatelessWidget {
  final RegisterController registerController = Get.find();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  RegisterPage({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> _register() async {
    if (_formKey.currentState!.validate()) {
      await registerController.register(emailController.text, passwordController.text, nameController.text);
    } else {
      Get.snackbar("Error", "Please correct the errors in the form");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Register',
          style: AppTextStyle.headingStyle2,
        ),
        backgroundColor: AppColors.primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text('Create Account', style: AppTextStyle.headingStyle),
                const SizedBox(height: 20),
                NameField(controller: nameController),
                const SizedBox(height: 15),
                EmailField(controller: emailController),
                const SizedBox(height: 15),
                PasswordField(controller: passwordController),
                const SizedBox(height: 20),
                LoadingButton(
                  text: 'Sign Up',
                  onPressed: _register,
                  color: Colors.blue,
                  textColor: Colors.white,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
