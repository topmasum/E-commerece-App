import 'package:flutter/material.dart';
import 'package:ui_based_ecommerce/app/extentions/localization_extension.dart';
import 'package:ui_based_ecommerce/features/auth/presentation/screens/signUp.dart';
import 'package:ui_based_ecommerce/features/auth/presentation/widegts/applogo.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});
  static const String name = '/sign_in';
  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final texttheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                SizedBox(height: 48),
                App_logo(width: 100),
                SizedBox(height: 16),
                Text(
                  context.localization.welcomeback,
                  style: texttheme.titleLarge,
                ),
                Text(
                  context.localization.headline,
                  style: texttheme.bodyLarge?.copyWith(color: Colors.grey),
                ),
                SizedBox(height: 24),
                TextFormField(
                  controller: _emailController,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(hintText: 'Email'),
                ),
                SizedBox(height: 8),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(hintText: 'Password'),
                ),
                SizedBox(height: 16),
                FilledButton(
                  onPressed: _onTaploginButton,
                  child: Text('Submit'),
                ),
                SizedBox(height: 16),
                TextButton(
                  onPressed: _ontapSigninbutton,
                  child: Text('SignUp'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onTaploginButton() {}
  void _ontapSigninbutton() {
    Navigator.pushNamed(context, SignUp.name);
  }
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
