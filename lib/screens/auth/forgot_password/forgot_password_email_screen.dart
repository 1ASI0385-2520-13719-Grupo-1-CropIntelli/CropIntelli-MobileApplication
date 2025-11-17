import 'package:flutter/material.dart';
import '../../../theme/app_theme.dart';
import 'forgot_password_code_screen.dart';

class ForgotPasswordEmailScreen extends StatefulWidget {
  const ForgotPasswordEmailScreen({super.key});

  @override
  State<ForgotPasswordEmailScreen> createState() =>
      _ForgotPasswordEmailScreenState();
}

class _ForgotPasswordEmailScreenState
    extends State<ForgotPasswordEmailScreen> {
  final TextEditingController emailCtrl = TextEditingController();
  bool codeSent = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 16),

            // Back button
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                icon: const Icon(Icons.arrow_back, color: AppColors.primary),
                onPressed: () => Navigator.pop(context),
              ),
            ),

            const SizedBox(height: 10),

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

            _label("Escriba su correo electrónico"),

            _input(emailCtrl, hint: "email"),

            const SizedBox(height: 20),

            _button(
              "Enviar Código",
              () {
                setState(() => codeSent = true);

                Future.delayed(const Duration(milliseconds: 900), () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const ForgotPasswordCodeScreen(),
                    ),
                  );
                });
              },
            ),

            if (codeSent) ...[
              const SizedBox(height: 12),
              const Text(
                "El código fue enviado a su correo",
                style: TextStyle(color: AppColors.primary),
              ),
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

  Widget _label(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, bottom: 6),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          text,
          style: const TextStyle(
            color: AppColors.primary,
            fontSize: 15,
          ),
        ),
      ),
    );
  }

  Widget _input(TextEditingController c, {required String hint}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: TextField(
        controller: c,
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
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
          ),
          onPressed: onPressed,
          child: Text(text, style: const TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}
