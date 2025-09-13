import 'package:flutter/material.dart';
import 'package:ui_based_ecommerce/features/auth/presentation/screens/verify_otp.dart';
import 'package:ui_based_ecommerce/features/auth/presentation/widegts/applogo.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});
  static const String name = '/sign_up';
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _firstnameController= TextEditingController();
  final TextEditingController _lastnameController= TextEditingController();
  final TextEditingController _mobileController= TextEditingController();
  final TextEditingController _addressController= TextEditingController();

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
                SizedBox(height: 30),
                App_logo(width: 80),
                SizedBox(height: 16),
                Text(
                  'Create an account',
                  style: texttheme.titleLarge,
                ),
                Text(
                  'Enter your details for new account',
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
                  controller: _firstnameController,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(hintText: 'First Name'),
                ),
                SizedBox(height: 8),
                TextFormField(
                  controller: _lastnameController,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(hintText: 'Last name'),
                ),
                SizedBox(height: 8),
                TextFormField(
                  controller: _mobileController,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(hintText: 'Mobile'),
                ),
                SizedBox(height: 8),
                TextFormField(
                  controller: _addressController,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(hintText: 'Address'),
                ),
                SizedBox(height: 8,),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(hintText: 'Password'),
                ),
                SizedBox(height: 16),
                FilledButton(
                  onPressed: _onTapsignupButton,
                  child: Text('Sign Up'),
                ),
                SizedBox(height: 16),
                TextButton(
                  onPressed: _ontapSigninbutton,
                  child: Text('Go Back to LogIn'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onTapsignupButton() {
    Navigator.pushNamed(context, VerifyOtp.name);
  }
  void _ontapSigninbutton() {
    Navigator.pop(context);
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
