import 'package:flutter/material.dart';
import 'package:user_management_task/config/ui/colors/app_colors.dart';
import 'package:user_management_task/config/ui/text_style/app_text_style.dart';
import '../../../../components/buttons/loading_button.dart';
import 'package:get/get.dart';
import 'package:user_management_task/modules/auth/presentation/pages/register_page.dart';
import '../controllers/login_controller.dart';
import '../widgets/text_fileds/email_field.dart';
import '../widgets/text_fileds/password_field.dart';

class LoginPage extends StatelessWidget {
  final LoginController loginController = Get.find<LoginController>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginPage({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future _login() async {
    if (_formKey.currentState!.validate()) {
      if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
        await loginController.login(emailController.text, passwordController.text);
      }
    } else {
      Get.snackbar("Error", "Please enter email and password");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Login',
          style: AppTextStyle.headingStyle2,
        ),
        backgroundColor: AppColors.primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const WelcomeText(),
                  const SizedBox(height: 20),
                  EmailField(controller: emailController),
                  const SizedBox(height: 15),
                  PasswordField(controller: passwordController),
                  const SizedBox(height: 20),
                  LoginButton(onPressed: _login),
                  const RegisterButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class RegisterButton extends StatelessWidget {
  const RegisterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Get.to(() => RegisterPage());
      },
      child: const Text("Don't have an account? Sign up"),
    );
  }
}

class LoginButton extends StatelessWidget {
  final Future<void> Function() onPressed;

  const LoginButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return LoadingButton(
      text: 'Login',
      onPressed: onPressed,
      color: Colors.blue,
      textColor: Colors.white,
    );
  }
}

class WelcomeText extends StatelessWidget {
  const WelcomeText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text('Welcome Back!', style: Theme.of(context).textTheme.titleLarge);
  }
}
