import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:ui_based_ecommerce/features/auth/presentation/screens/sign_in.dart';
import 'package:ui_based_ecommerce/features/auth/presentation/widegts/applogo.dart';

class VerifyOtp extends StatefulWidget {
  const VerifyOtp({super.key});
  static const String name = '/verify-otp';
  @override
  State<VerifyOtp> createState() => _VerifyOtpState();
}

class _VerifyOtpState extends State<VerifyOtp> {
  final TextEditingController _OTPController = TextEditingController();
  int _remainingSeconds = 120; // start from 120 sec
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startCountdown();
  }

  void _startCountdown() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingSeconds > 0) {
        setState(() {
          _remainingSeconds--;
        });
      } else {
        _timer?.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const SizedBox(height: 48),
                App_logo(width: 100),
                const SizedBox(height: 16),
                Text(
                  'Verify OTP',
                  style: textTheme.titleLarge,
                ),
                Text(
                  'Enter your 4 digit OTP code',
                  style: textTheme.bodyLarge?.copyWith(color: Colors.grey),
                ),
                const SizedBox(height: 24),

                /// OTP TextField
                PinCodeTextField(
                  length: 4,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(8),
                    fieldHeight: 50,
                    fieldWidth: 50, // smaller for closer boxes
                    activeFillColor: Colors.white,
                  ),
                  mainAxisAlignment: MainAxisAlignment.center,
                  appContext: context,
                  controller: _OTPController,
                ),

                const SizedBox(height: 8),
                Text(
                  _remainingSeconds > 0
                      ? "This OTP will expire within $_remainingSeconds sec"
                      : "OTP expired! Please request again.",
                  style: textTheme.bodySmall?.copyWith(
                    color: _remainingSeconds > 0 ? Colors.red : Colors.grey,
                  ),
                ),

                const SizedBox(height: 16),
                FilledButton(
                  onPressed:
                  _remainingSeconds > 0 ? _onTaploginButton : null, // disable if expired
                  child: const Text('Verify'),
                ),
                const SizedBox(height: 16),
                TextButton(
                  onPressed: _ontapGobacktoLoginbutton,
                  child: const Text('Go Back to LogIn'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onTaploginButton() {
    // handle OTP verification
  }

  void _ontapGobacktoLoginbutton() {
    Navigator.pushNamedAndRemoveUntil(context, SignIn.name, (p) => false);
  }

  @override
  void dispose() {
    _OTPController.dispose();
    _timer?.cancel(); // stop timer when screen is disposed
    super.dispose();
  }
}
