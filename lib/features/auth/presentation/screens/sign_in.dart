import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_based_ecommerce/app/extentions/localization_extension.dart';
import 'package:ui_based_ecommerce/features/auth/data/models/login_request_model.dart';
import 'package:ui_based_ecommerce/features/auth/presentation/controllers/login_controller.dart';
import 'package:ui_based_ecommerce/features/auth/presentation/screens/signUp.dart';
import 'package:ui_based_ecommerce/features/auth/presentation/widegts/applogo.dart';
import '../../../../app/controller/auth_controller.dart';
import '../../../share/presentation/screen/bottem_navigation_screen.dart';
import '../../../share/presentation/widget/snackbar_message.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});
  static const String name = '/sign_in';

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final LoginController _loginController = Get.find<LoginController>();
  final _formKey = GlobalKey<FormState>(); // ✅ Added form key
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    final texttheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey, // ✅ wrap with form
              child: Column(
                children: [
                  const SizedBox(height: 48),
                  App_logo(width: 100),
                  const SizedBox(height: 16),
                  Text(
                    context.localization.welcomeback,
                    style: texttheme.titleLarge,
                  ),
                  Text(
                    context.localization.headline,
                    style: texttheme.bodyLarge?.copyWith(color: Colors.grey),
                  ),
                  const SizedBox(height: 24),

                  // EMAIL FIELD
                  TextFormField(
                    controller: _emailController,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(hintText: 'Email'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
                      if (!emailRegex.hasMatch(value)) {
                        return 'Enter a valid email address';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 8),

                  // PASSWORD FIELD
                  TextFormField(
                    controller: _passwordController,
                    obscureText: !_isPasswordVisible,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),

                  // SUBMIT BUTTON
                  FilledButton(
                    onPressed: _onTaploginButton,
                    child: const Text('Submit'),
                  ),
                  const SizedBox(height: 16),

                  TextButton(
                    onPressed: _ontapSigninbutton,
                    child: const Text('SignUp'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onTaploginButton() {
    if (_formKey.currentState!.validate()) {
      _signIn();
    } else {
      showSnackBarMessage(
          context, 'Please correct the errors before submitting.');
    }
  }

  Future<void> _signIn() async {
    LoginRequestModel model = LoginRequestModel(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    );

    bool isSuccess = await _loginController.logIn(model);

    if (isSuccess) {
      await Get.find<AuthController>()
          .saveUserData(_loginController.userModel!, _loginController.accessToken!);

      // Navigate to dashboard
      Navigator.pushNamedAndRemoveUntil(
        context,
        BottemNavigationScreen.name,
            (p) => false,
      );
    } else {
      showSnackBarMessage(context, _loginController.errorMessage ?? 'Login failed');
    }
  }

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
