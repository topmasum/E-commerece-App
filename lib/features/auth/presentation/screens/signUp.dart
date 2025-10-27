import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_based_ecommerce/features/auth/data/models/signup_request.dart';
import 'package:ui_based_ecommerce/features/auth/presentation/controllers/signup_screen_controller.dart';
import 'package:ui_based_ecommerce/features/auth/presentation/screens/sign_in.dart';
import 'package:ui_based_ecommerce/features/auth/presentation/screens/verify_otp.dart';
import 'package:ui_based_ecommerce/features/auth/presentation/widegts/applogo.dart';
import 'package:ui_based_ecommerce/features/share/presentation/widget/centered_circuler_progress.dart';
import 'package:ui_based_ecommerce/features/share/presentation/widget/snackbar_message.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});
  static const String name = '/sign_up';

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _firstnameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  final _formKey = GlobalKey<FormState>(); // ✅ Added form key
  final SignupScreenController _signupScreenController =
  Get.find<SignupScreenController>();

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
              key: _formKey, // ✅ Added form wrapper
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  App_logo(width: 80),
                  const SizedBox(height: 16),
                  Text('Create an account', style: texttheme.titleLarge),
                  Text(
                    'Enter your details for new account',
                    style: texttheme.bodyLarge?.copyWith(color: Colors.grey),
                  ),
                  const SizedBox(height: 24),

                  // EMAIL
                  TextFormField(
                    controller: _emailController,
                    textInputAction: TextInputAction.next,
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

                  // FIRST NAME
                  TextFormField(
                    controller: _firstnameController,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(hintText: 'First Name'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your first name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 8),

                  // LAST NAME
                  TextFormField(
                    controller: _lastnameController,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(hintText: 'Last Name'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your last name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 8),

                  // MOBILE
                  TextFormField(
                    controller: _mobileController,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(hintText: 'Mobile'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your mobile number';
                      }
                      if (value.length < 10) {
                        return 'Enter a valid phone number';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 8),

                  // CITY / ADDRESS
                  TextFormField(
                    controller: _addressController,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(hintText: 'City'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your city';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 8),

                  // PASSWORD
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

                  // SIGN UP BUTTON
                  GetBuilder<SignupScreenController>(
                    builder: (controller) {
                      return Visibility(
                        visible: controller.signUpProgress == false,
                        replacement: const CenteredCirculerProgress(),
                        child: FilledButton(
                          onPressed: _onTapsignupButton,
                          child: const Text('Sign Up'),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 16),

                  // GO BACK BUTTON
                  TextButton(
                    onPressed: _ontapSigninbutton,
                    child: const Text('Go Back to LogIn'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // ✅ Validate form before signup
  void _onTapsignupButton() {
    if (_formKey.currentState!.validate()) {
      _signup();
    } else {
      showSnackBarMessage(context, 'Please correct the errors before submitting.');
    }
  }

  Future<void> _signup() async {
    SignupRequestModel model = SignupRequestModel(
      firstName: _firstnameController.text.trim(),
      lastName: _lastnameController.text.trim(),
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
      city: _addressController.text.trim(),
      phone: _mobileController.text.trim(),
    );

    final bool isSuccess = await _signupScreenController.signUp(model);

    if (isSuccess) {
      showSnackBarMessage(context, 'SignUp has been successful');
      Navigator.pushNamed(
        context,
        VerifyOtp.name,
        arguments: _emailController.text.trim(),
      );
    } else {
      showSnackBarMessage(context, _signupScreenController.errorMessage ?? 'Signup failed');
    }
  }

  void _ontapSigninbutton() {
    Navigator.pushNamed(context, SignIn.name);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _mobileController.dispose();
    _addressController.dispose();
    _firstnameController.dispose();
    _lastnameController.dispose();
    super.dispose();
  }
}
