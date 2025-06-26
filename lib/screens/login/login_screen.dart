// lib/screens/login/login_screen.dart
import 'package:family_registration/utils/theme/widget_themes/elevated_button_theme.dart';
import 'package:family_registration/utils/theme/widget_themes/text_field_theme.dart';
import 'package:flutter/material.dart';
import '../../services/auth_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController phoneController = TextEditingController();
  final AuthService _authService = AuthService();
  bool isLoading = false;

  void _sendOtp() async {
    final phone = phoneController.text.trim();

    if (phone.isEmpty || phone.length < 10) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Enter a valid phone number")),
      );
      return;
    }

    setState(() => isLoading = true);

    await _authService.sendOtp(
      phoneNumber: "+92$phone", // Country code
      onCodeSent: (String verificationId) {
        setState(() => isLoading = false);

        // ✅ Navigate using named route with arguments
        Navigator.pushNamed(context, '/otp', arguments: verificationId);
      },
      onError: (e) {
        setState(() => isLoading = false);
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Error: ${e.message}")));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFF2B0A5C),
        title: Text(
          'LOGIN TO APP ',
          style: TextStyle(
            fontWeight: FontWeight.w900,
            fontFamily: 'Poppins',
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Container(color: Colors.white.withOpacity(0.3), height: 1.0),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
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
                "Enter your phone number",
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontFamily: 'Poppins',
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
               SizedBox(height: 10),
              TextField(
                controller: phoneController,style: TextStyle(
                   fontWeight: FontWeight.w900,
                    fontFamily: 'Poppins',
                    color: Colors.white,
                    fontSize: 14,
                ),
                decoration: InputDecoration(
                  hintText: " Enter Phone Number",
                  focusedBorder: TTextFormFieldTheme.lightInputDecorationTheme.focusedBorder,
                  enabledBorder: TTextFormFieldTheme.lightInputDecorationTheme.enabledBorder,
                  hintStyle:  TextStyle(
                    fontWeight: FontWeight.w900,
                    fontFamily: 'Poppins',
                    color: Colors.white,
                    fontSize: 14,
                  ),
                  prefixText: "+92 ",
                  prefixStyle: const TextStyle(
                    fontWeight: FontWeight.w900,
                    fontFamily: 'Poppins',
                    color: Colors.white,
                    fontSize: 14,
                  ),
                  border: const OutlineInputBorder(),
                ),
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 20),
              SizedBox(width: double.infinity,
                child: ElevatedButton(
                  style: TElevatedButtonTheme.lightElevatedButtonTheme.style,
                  onPressed: isLoading ? null : _sendOtp,
                  child:
                      isLoading
                          ? const CircularProgressIndicator()
                          : const Text("Send OTP"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
