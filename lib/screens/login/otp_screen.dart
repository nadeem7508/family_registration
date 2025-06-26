import 'package:family_registration/utils/theme/widget_themes/elevated_button_theme.dart';
import 'package:family_registration/utils/theme/widget_themes/text_field_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/auth_provider.dart';
import '../../services/auth_service.dart';
import '../../routes/app_routes.dart';

class OtpScreen extends StatefulWidget {
  final String verificationId;

  const OtpScreen({required this.verificationId});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final TextEditingController otpController = TextEditingController();
  final AuthService _authService = AuthService();
  bool isVerifying = false;

  void _verifyOtp() async {
    setState(() => isVerifying = true);

    try {
      final success = await _authService.verifyOtp(otpController.text.trim());

      if (success) {
        context.read<AuthProvider>().login();

        Navigator.pushNamedAndRemoveUntil(
          context,
          AppRoutes.home,
          (route) => false,
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Invalid OTP")),
        );
      }
    } catch (e) {
      setState(() => isVerifying = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Verification failed: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFF2B0A5C),
        title: const Text(
          'OTP SCREEN ',
          style: TextStyle(
            fontWeight: FontWeight.w900,
            fontFamily: 'Poppins',
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(color: Colors.white.withOpacity(0.3), height: 1.0),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 51, 4, 92),
              Color.fromARGB(255, 58, 11, 158),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const Text(
                "Enter your OTP Code",
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontFamily: 'Poppins',
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: otpController,
                style: const TextStyle(
                  fontWeight: FontWeight.w900,
                  fontFamily: 'Poppins',
                  color: Colors.white,
                  fontSize: 14,
                ),
                decoration: InputDecoration(
                  hintText: "Enter OTP",
                  focusedBorder:
                      TTextFormFieldTheme.lightInputDecorationTheme.focusedBorder,
                  enabledBorder:
                      TTextFormFieldTheme.lightInputDecorationTheme.enabledBorder,
                  hintStyle: const TextStyle(
                    fontWeight: FontWeight.w900,
                    fontFamily: 'Poppins',
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
                keyboardType: TextInputType.number,
                maxLength: 6,
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: TElevatedButtonTheme.lightElevatedButtonTheme.style,
                  onPressed: isVerifying ? null : _verifyOtp,
                  child: isVerifying
                      ? const CircularProgressIndicator()
                      : const Text("Verify OTP"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
