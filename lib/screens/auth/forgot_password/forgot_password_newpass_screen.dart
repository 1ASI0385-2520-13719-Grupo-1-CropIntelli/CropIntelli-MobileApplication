import 'package:flutter/material.dart';
import '../../../theme/app_theme.dart';
import 'forgot_password_success_screen.dart';

class ForgotPasswordNewPassScreen extends StatefulWidget {
  const ForgotPasswordNewPassScreen({super.key});

  @override
  State<ForgotPasswordNewPassScreen> createState() =>
      _ForgotPasswordNewPassScreenState();
}

class _ForgotPasswordNewPassScreenState
    extends State<ForgotPasswordNewPassScreen> {
  final pass1 = TextEditingController();
  final pass2 = TextEditingController();

  bool done = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 16),

            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                icon: const Icon(Icons.arrow_back, color: AppColors.primary),
                onPressed: () => Navigator.pop(context),
              ),
            ),

            _logo(),

            const SizedBox(height: 10),

            const Text(
              "Reestablecer\nContraseña",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            _input(pass1, "Digite su nueva contraseña"),
            const SizedBox(height: 14),
            _input(pass2, "Repita la contraseña digitada"),

            const SizedBox(height: 20),

            _button("Reestablecer", () {
              setState(() => done = true);

              Future.delayed(const Duration(milliseconds: 900), () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const ForgotPasswordSuccessScreen(),
                  ),
                );
              });
            }),

            if (done) ...[
              const SizedBox(height: 8),
              const Text("Contraseña reestablecida",
                  style: TextStyle(color: AppColors.primary)),
            ]
          ],
        ),
      ),
    );
  }

  Widget _logo() {
    return Container(
      width: 120,
      height: 120,
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Icon(Icons.spa, color: Colors.white, size: 70),
    );
  }

  Widget _input(TextEditingController c, String hint) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: TextField(
        controller: c,
        obscureText: true,
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.inputBackground,
          hintText: hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  Widget _button(String text, VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: SizedBox(
        width: double.infinity,
        height: 48,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary),
          onPressed: onPressed,
          child: Text(text, style: const TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}
